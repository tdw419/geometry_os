; plasma.asm - enhanced plasma screen saver with 4 phase offsets and TICKS throttle
;
; Fills 256x256 screen with smoothly animated color waves using 4 phase offsets.
; Implements TICKS-based animation throttle for consistent speed.
; Adds smooth color palette cycling over time.
;
; Algorithm per pixel (x, y):
;   v1 = sin_table[(x + phase1) & 0xFF]
;   v2 = sin_table[(y + phase2) & 0xFF]
;   v3 = sin_table[((x + y) + phase3) & 0xFF]
;   v4 = sin_table[((x - y) + phase4) & 0xFF]
;   v = (v1 + v2 + v3 + v4) & 0xFF
;   r = sin_table[v]
;   g = sin_table[(v + 85) & 0xFF]      ; 120-degree phase shift
;   b = sin_table[(v + 170) & 0xFF]     ; 240-degree phase shift
;   PSET x, y, (r << 16) | (g << 8) | b
;
; Register convention:
;   r10 = y counter         r11 = x counter
;   r12 = phase1            r13 = phase2
;   r14 = phase3            r15 = phase4
;   r16 = sine table base   r7  = 1 (increment)
;   r17-r23 = temp/accums   r24 = TICKS counter
;
; TICKS throttle: phase updates only every 8 frames (~7.5 updates/sec at 60fps)
; Color palette cycle: shift by 8 every 256 frames for 1-color cycle/sec

; === Build sine table at boot ===
LDI r16, 0x2000        ; sine table base address
LDI r15, 256           ; limit

; Cosine table: val = 255 - 127 * (i - 128)^2 / 16384
; This gives values 128-255 for i=0..255
build_sine:
  ; Compute distance from 128
  MOV r17, r10         ; r17 = i
  LDI r18, 128
  CMP r10, r18
  BGE r0, above_128
  
  ; Below 128: delta = 128 - i
  MOV r17, r18
  SUB r17, r10         ; r17 = 128 - i
  JMP do_square
  
above_128:
  ; At or above 128: delta = i - 128
  MOV r17, r10
  SUB r17, r18         ; r17 = i - 128
  
do_square:
  MUL r17, r17         ; r17 = delta^2 (0 to 16384)
  
  ; Scale: 127 * delta^2 / 16384
  LDI r18, 127
  MUL r17, r18         ; r17 = 127 * delta^2
  LDI r18, 16384
  DIV r17, r18         ; r17 = 127 * delta^2 / 16384
  
  ; val = 255 - r17
  LDI r18, 255
  SUB r18, r17         ; r18 = sine table value
  
  ; Store in table
  MOV r19, r16
  ADD r19, r10         ; r19 = base + index
  STORE r19, r18       ; table[i] = val
  
  ADD r10, r7           ; i++
  CMP r10, r15
  BLT r0, build_sine

; === Main animation loop with TICKS throttle ===
LDI r12, 0             ; phase1
LDI r13, 0             ; phase2
LDI r14, 0             ; phase3
LDI r15, 0             ; phase4
LDI r16, 0x2000        ; sine table base
LDI r7, 1
LDI r24, 0xFFE         ; TICKS port

frame_loop:
  ; Check TICKS: only update phases every 8 frames
  LOAD r8, r24         ; r8 = TICKS
  LDI r9, 7            ; mask = 7
  AND r8, r9           ; r8 = TICKS & 7
  
  ; If TICKS & 7 == 0, we're on an update frame
  JZ r8, update_phases
  JMP render_frame     ; skip phase updates
  
update_phases:
  ; Advance phases (different speeds for rich patterns)
  LDI r10, 2           ; phase1 += 2
  ADD r12, r10
  
  LDI r10, 3           ; phase2 += 3
  ADD r13, r10
  
  LDI r10, 1           ; phase3 += 1
  ADD r14, r10
  
  LDI r10, 4           ; phase4 += 4
  ADD r15, r10
  
  ; Color palette cycle: shift phases by 8 every 256 frames
  LOAD r8, r24
  LDI r10, 256
  DIV r8, r10          ; r8 = TICKS / 256
  LDI r11, 8
  AND r8, r11          ; r8 = (TICKS/256) & 8
  
  ; If color cycle reached 8, shift all phases by 8
  JNZ r8, next_color_check
  LDI r10, 8
  ADD r12, r10         ; phase1 += 8
  ADD r13, r10         ; phase2 += 8
  ADD r14, r10         ; phase3 += 8
  ADD r15, r10         ; phase4 += 8
  ; This creates a full color cycle in 256 frames (8 shifts)

next_color_check:
render_frame:
  LDI r10, 0           ; y = 0

y_loop:
  LDI r11, 0           ; x = 0

x_loop:
  ; v1 = sin_table[(x + phase1) & 0xFF]
  MOV r17, r11
  ADD r17, r12
  LDI r18, 0xFF
  AND r17, r18
  ADD r17, r16
  LOAD r17, r17        ; r17 = v1
  
  ; v2 = sin_table[(y + phase2) & 0xFF]
  MOV r18, r10
  ADD r18, r13
  LDI r19, 0xFF
  AND r18, r19
  ADD r18, r16
  LOAD r18, r18        ; r18 = v2
  
  ; v3 = sin_table[((x + y) + phase3) & 0xFF]
  MOV r19, r11
  ADD r19, r10
  ADD r19, r14
  LDI r20, 0xFF
  AND r19, r20
  ADD r19, r16
  LOAD r19, r19        ; r19 = v3
  
  ; v4 = sin_table[((x - y) + phase4) & 0xFF]
  MOV r20, r11
  SUB r20, r10         ; x - y
  ADD r20, r15
  LDI r21, 0xFF
  AND r20, r21
  ADD r20, r16
  LOAD r20, r20        ; r20 = v4
  
  ; sum = (v1 + v2 + v3 + v4) & 0xFF
  MOV r21, r17
  ADD r21, r18
  ADD r21, r19
  ADD r21, r20
  LDI r22, 0xFF
  AND r21, r22         ; sum & 0xFF
  
  ; R = sin_table[sum]
  MOV r22, r21
  ADD r22, r16
  LOAD r22, r22        ; r22 = red
  
  ; G = sin_table[(sum + 85) & 0xFF]
  MOV r23, r21
  LDI r25, 85
  ADD r23, r25
  LDI r25, 0xFF
  AND r23, r25
  ADD r23, r16
  LOAD r23, r23        ; r23 = green
  
  ; B = sin_table[(sum + 170) & 0xFF]
  MOV r24, r21
  LDI r25, 170
  ADD r24, r25
  LDI r25, 0xFF
  AND r24, r25
  ADD r24, r16
  LOAD r24, r24        ; r24 = blue
  
  ; Pack RGB: (R << 16) | (G << 8) | B
  LDI r25, 16
  SHL r22, r25
  LDI r25, 8
  SHL r23, r25
  OR r22, r23
  OR r22, r24
  
  PSET r11, r10, r22   ; draw pixel
  
  ; x++
  ADD r11, r7
  CMP r11, r15
  BLT r0, x_loop
  
  ; y++
  ADD r10, r7
  CMP r10, r15
  BLT r0, y_loop
  
  ; Yield to renderer
  FRAME
  
  JMP frame_loop
  
  HALT                 ; unreachable -- infinite animation
