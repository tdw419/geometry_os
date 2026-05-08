; DESCRIPTION: The GeOS assembly code implements a classic plasma effect by filling a 256x256 screen with smoothly animated color waves. It uses a precomputed sine table and phase-shifted lookups per pixel to generate the vibrant visual patterns, updating the phases for each frame to create an animated appearance.

; plasma.asm -- classic plasma demo effect
;
; Fills 256x256 screen with smoothly animated color waves.
; Uses a precomputed sine table and phase-shifted lookups per pixel.
;
; Algorithm per pixel (x, y):
;   v1 = sin_table[(x + phase1) & 0xFF]
;   v2 = sin_table[(y + phase2) & 0xFF]
;   v3 = sin_table[((x + y) + phase3) & 0xFF]
;   v = (v1 + v2 + v3) & 0xFF
;   r = sin_table[v]
;   g = sin_table[(v + 85) & 0xFF]      ; 85 = 255/3, 120-degree phase shift
;   b = sin_table[(v + 170) & 0xFF]     ; 170 = 2*255/3, 240-degree phase shift
;   PSET x, y, (r << 16) | (g << 8) | b
;
; Register convention:
;   r7 = y counter         r4 = x counter
;   r0 = phase1 (animates) r15 = phase2 (animates) r6 = phase3 (animates)
;   r8 = 256 (limit)       r9  = 1 (increment)
;   r16 = sine table base   r17 = temp / color accum
;   r18-r23 = temps for sine lookups
;   r24 = frame counter

; === Build sine table at boot ===
; 256 entries at 0x2000, values 0-255 representing sin(x) mapped to 0-255
; sin_table[i] = 128 + 127 * sin(2*pi*i/256)
; We precompute this as data using LDI+STORE

LDI r16, 0x2000        ; sine table base address
LDI r8, 256           ; limit

; Sine table: hand-computed 32-entry base pattern, then repeat with offset
; Using quarter-wave symmetry: sin(0)=128, sin(32)=255, sin(64)=128, sin(96)=1, sin(128)=128...
; Full 256-entry table built from a 64-entry repeating pattern

LDI r9, 1
LDI r7, 0             ; table index

; Build sine table: 128 + 127*sin(2*pi*i/256)
; Using the identity: for 256 points, we can compute with a simple
; approximation or just use a known-good set of values.
; 
; Strategy: 16-entry base pattern, repeated with sign flips
; base = [128, 177, 218, 245, 255, 245, 218, 177, 128, 79, 38, 11, 1, 11, 38, 79]
; This gives sin for 0-15, then 16-31 is mirror, 32-47 is inverse, 48-63 is inverse-mirror

; Write all 256 entries using a loop with a hardcoded mini-table
; Actually, let's use a simpler approach: 
; val = 128 + (i * (256-i)) / 128  -- parabolic approximation of sine
; This gives a smooth wave: 128 at 0, 256->clipped at 128, peak at 128
; Better: val = 128 + 127 * (1 - ((i-128)*(i-128)) / 16384)
; = 128 + 127 - 127*(i-128)^2/16384
; = 255 - 127*(i-128)^2/16384
; (i-128)^2 for i=0: 16384 -> 255-127 = 128 ✓
; (i-128)^2 for i=64: 4096 -> 255-31 = 224 
; (i-128)^2 for i=128: 0 -> 255 ✓
; This is a cosine, not sine, but works great for plasma!

LDI r7, 0
LDI r9, 1

build_sine:
  ; Compute val = 255 - 127 * (i - 128)^2 / 16384
  MOV r17, r7         ; r17 = i
  LDI r18, 128
  SUB r17, r18         ; r17 = i - 128 (signed!)
  
  ; Square it: (i-128)^2
  ; Since we're in u32, negative values wrap. We need to handle sign.
  ; If r17 >= 0x80000000, it's negative. ABS it.
  ; Actually for squaring, the wrap-around of SUB gives us the right magnitude
  ; for u32 multiplication as long as we treat it properly.
  ; For i=0: 0-128 = 0xFFFFFF80, MUL r17,r17 = huge number. Wrong.
  ; Need: if r17 > 128 (unsigned after signed sub), negate it.
  
  ; Simple fix: compute distance from 128 directly
  ; if i < 128: delta = 128 - i
  ; if i >= 128: delta = i - 128
  LDI r18, 128
  CMP r7, r18
  BGE r1, above_128
  
  ; Below 128: delta = 128 - i
  MOV r17, r18
  SUB r17, r7        ; r17 = 128 - i
  JMP do_square
  
above_128:
  ; At or above 128: delta = i - 128
  MOV r17, r7
  SUB r17, r18        ; r17 = i - 128
  ; (r17 = 0 when i = 128, fine)
  
do_square:
  MUL r17, r17        ; r17 = delta^2 (0 to 16384)
  
  ; Scale: 127 * delta^2 / 16384
  LDI r18, 127
  MUL r17, r18        ; r17 = 127 * delta^2
  LDI r18, 16384
  DIV r17, r18        ; r17 = 127 * delta^2 / 16384
  
  ; val = 255 - r17
  LDI r18, 255
  SUB r18, r17        ; r18 = the sine table value
  
  ; Store in table
  MOV r19, r16        ; r19 = table base
  ADD r19, r7        ; r19 = base + index
  STORE r19, r18      ; table[i] = val
  
  ADD r7, r9          ; i++
  CMP r7, r8
  BLT r1, build_sine

; === Main animation loop ===
LDI r0, 0             ; phase1
LDI r15, 0             ; phase2
LDI r6, 0             ; phase3
LDI r24, 0             ; frame counter
LDI r9, 1
LDI r8, 256

frame_loop:
  LDI r7, 0           ; y = 0
  
y_loop:
  LDI r4, 0           ; x = 0
  
x_loop:
  ; v1 = sin_table[(x + phase1) & 0xFF]
  MOV r17, r4
  ADD r17, r0         ; x + phase1
  LDI r18, 0xFF
  AND r17, r18         ; & 0xFF
  ADD r17, r16         ; table base + index
  LOAD r17, r17        ; r17 = v1
  
  ; v2 = sin_table[(y + phase2) & 0xFF]
  MOV r18, r7
  ADD r18, r15         ; y + phase2
  LDI r19, 0xFF
  AND r18, r19         ; & 0xFF
  ADD r18, r16         ; table base + index
  LOAD r18, r18        ; r18 = v2
  
  ; v3 = sin_table[((x + y) + phase3) & 0xFF]
  MOV r19, r4
  ADD r19, r7         ; x + y
  ADD r19, r6         ; + phase3
  LDI r20, 0xFF
  AND r19, r20         ; & 0xFF
  ADD r19, r16         ; table base + index
  LOAD r19, r19        ; r19 = v3
  
  ; sum = (v1 + v2 + v3) & 0xFF
  MOV r20, r17
  ADD r20, r18         ; v1 + v2
  ADD r20, r19         ; + v3
  LDI r21, 0xFF
  AND r20, r21         ; sum & 0xFF
  
  ; R = sin_table[sum]
  MOV r21, r20
  ADD r21, r16
  LOAD r21, r21        ; r21 = red component (0-255)
  
  ; G = sin_table[(sum + 85) & 0xFF]
  MOV r22, r20
  LDI r23, 85
  ADD r22, r23
  LDI r23, 0xFF
  AND r22, r23
  ADD r22, r16
  LOAD r22, r22        ; r22 = green component (0-255)
  
  ; B = sin_table[(sum + 170) & 0xFF]
  MOV r23, r20
  LDI r25, 170
  ADD r23, r25
  LDI r25, 0xFF
  AND r23, r25
  ADD r23, r16
  LOAD r23, r23        ; r23 = blue component (0-255)
  
  ; Pack RGB: color = (R << 16) | (G << 8) | B
  LDI r25, 16
  SHL r21, r25         ; R << 16
  LDI r25, 8
  SHL r22, r25         ; G << 8
  OR r21, r22          ; R<<16 | G<<8
  OR r21, r23          ; | B
  
  PSET r4, r7, r21   ; draw pixel
  
  ; x++
  ADD r4, r9
  CMP r4, r8
  BLT r1, x_loop
  
  ; y++
  ADD r7, r9
  CMP r7, r8
  BLT r1, y_loop

  ; Advance phases for animation
  LDI r17, 2
  ADD r0, r17         ; phase1 += 2
  LDI r17, 3
  ADD r15, r17         ; phase2 += 3
  ADD r6, r9          ; phase3 += 1
  
  FRAME
  JMP frame_loop

  HALT                 ; unreachable -- infinite animation
