; DESCRIPTION: A red object centered at the screen with fixed size.

; starfield.asm -- 3D starfield zoom effect
;
; Classic demo scene effect: stars stream toward the viewer from
; a central vanishing point. Uses perspective projection.
;
; Algorithm:
;   - Pool of 128 stars, each stored as 3 words in RAM: x, y, z
;   - x, y: position (-128 to +127), z: depth (1-255)
;   - Projection: sx = x * 256 / z + 128, sy = y * 256 / z + 128
;   - Each frame: z decreases by 2, star recycles when z <= 0 or off-screen
;   - Brightness = 255 - z (closer = brighter)
;
; Star struct: [x, y, z] = 3 consecutive words
; Memory: 0x4000 + index*3 = base of star[index]
;
; Register convention (main loop):
;   r0  = 1
;   r1  = 128 (screen center)
;   r5 = star index (0-127)
;   r14 = 128 (star count)
;   r2 = 0x4000 (star pool base)
;   r12 = frame counter
;   r7 = 256 (projection scale)
;   r11 = current star base address

; === Initialize star pool ===
LDI r0, 1
LDI r1, 128
LDI r14, 128
LDI r2, 0x4000
LDI r7, 64             ; projection scale (smaller = wider FOV)
LDI r12, 0

LDI r5, 0               ; star index

init_loop:
  ; r11 = 0x4000 + index * 3
  MOV r11, r5
  LDI r16, 3
  MUL r11, r16
  ADD r11, r2            ; r11 = &star[index]

  ; x = (RAND & 0x7F) - 64  -> range -64..63
  RAND r16
  LDI r17, 0x7F
  AND r16, r17
  LDI r17, 64
  SUB r16, r17            ; r16 = x
  STORE r11, r16          ; star.x at base+0

  ; y = (RAND & 0x7F) - 64
  RAND r16
  LDI r17, 0x7F
  AND r16, r17
  LDI r17, 64
  SUB r16, r17            ; r16 = y
  MOV r17, r11
  ADD r17, r0             ; base+1
  STORE r17, r16          ; star.y at base+1

  ; z = (RAND & 0x7F) + 1 -> range 1..128 (start spread out)
  RAND r16
  LDI r17, 0x7F
  AND r16, r17
  ADD r16, r0             ; 1..128
  MOV r17, r11
  ADD r17, r0
  ADD r17, r0             ; base+2
  STORE r17, r16          ; star.z at base+2

  ADD r5, r0
  CMP r5, r14
  BLT r15, init_loop

; === Main animation loop ===
frame_loop:
  ; Clear screen to black
  LDI r11, 0
  FILL r11

  LDI r5, 0              ; star index

star_loop:
  ; r11 = 0x4000 + index * 3
  MOV r11, r5
  LDI r16, 3
  MUL r11, r16
  ADD r11, r2            ; r11 = &star[index]

  ; Load z from base+2
  MOV r16, r11
  ADD r16, r0
  ADD r16, r0             ; base+2
  LOAD r16, r16           ; r16 = z

  ; If z == 0, recycle
  JZ r16, recycle_star

  ; Load x from base+0
  LOAD r17, r11           ; r17 = x

  ; Project: sx = x * 256 / z + 128
  MOV r18, r17
  MUL r18, r7            ; r18 = x * 256
  DIV r18, r16            ; r18 = x * 256 / z
  ADD r18, r1             ; r18 = sx

  ; Load y from base+1
  MOV r19, r11
  ADD r19, r0             ; base+1
  LOAD r19, r19           ; r19 = y

  ; Project: sy = y * 256 / z + 128
  MOV r20, r19
  MUL r20, r7            ; r20 = y * 256
  DIV r20, r16            ; r20 = y * 256 / z
  ADD r20, r1             ; r20 = sy

  ; Bounds check sx: must be 0..255
  ; Check negative via SAR 31
  LDI r21, 31
  MOV r22, r18
  SAR r22, r21
  JNZ r22, recycle_star   ; negative -> off screen

  LDI r21, 256
  CMP r18, r21
  BGE r15, recycle_star    ; sx >= 256 -> off screen

  ; Bounds check sy
  LDI r21, 31
  MOV r22, r20
  SAR r22, r21
  JNZ r22, recycle_star

  LDI r21, 256
  CMP r20, r21
  BGE r15, recycle_star

  ; Brightness: 255 - z (closer = brighter)
  LDI r21, 255
  SUB r21, r16            ; r21 = 255 - z

  ; Make grayscale: color = b | (b << 8) | (b << 16)
  MOV r22, r21
  LDI r23, 8
  SHL r22, r23            ; r22 = b << 8
  MOV r23, r21
  LDI r24, 16
  SHL r23, r24            ; r23 = b << 16
  OR r22, r23             ; r22 = (b << 16) | (b << 8)
  OR r22, r21             ; r22 |= b

  ; Draw
  PSET r18, r20, r22

  ; Advance z: z -= 2
  MOV r16, r11
  ADD r16, r0
  ADD r16, r0             ; base+2 = &z
  LOAD r21, r16           ; r21 = current z
  LDI r22, 2
  SUB r21, r22            ; z -= 2

  ; If z <= 2, recycle (avoid z going to 0 which causes div-by-zero next frame)
  LDI r22, 2
  CMP r21, r22
  BLT r15, recycle_star_z  ; z < 2 -> recycle

  STORE r16, r21          ; save new z
  JMP next_star

recycle_star:
  ; Also recycles on z==0 from load -- need the base address in r11
recycle_star_z:
  ; New x = (RAND & 0x7F) - 64
  RAND r17
  LDI r18, 0x7F
  AND r17, r18
  LDI r18, 64
  SUB r17, r18
  STORE r11, r17          ; star.x

  ; New y = (RAND & 0x7F) - 64
  RAND r17
  LDI r18, 0x7F
  AND r17, r18
  LDI r18, 64
  SUB r17, r18
  MOV r18, r11
  ADD r18, r0             ; base+1
  STORE r18, r17          ; star.y

  ; New z = 255 (far away)
  LDI r17, 255
  MOV r18, r11
  ADD r18, r0
  ADD r18, r0             ; base+2
  STORE r18, r17          ; star.z = 255

next_star:
  ADD r5, r0
  CMP r5, r14
  BLT r15, star_loop

  ; Next frame
  ADD r12, r0
  FRAME
  JMP frame_loop
