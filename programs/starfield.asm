; starfield.asm -- 3D starfield warp effect with motion streaks
;
; Classic demo scene effect: stars stream toward the viewer from
; a central vanishing point. Uses perspective projection with speed
; control and LINE-based streak rendering for motion blur.
;
; Deliverables (Phase 394):
;   1. 3D star points with Z-depth perspective projection
;   2. Speed-controlled warp effect using DIV for projection
;   3. Streak rendering with LINE opcode for motion blur
;
; Algorithm:
;   - Pool of 128 stars, each stored as 3 words in RAM: x, y, z
;   - x, y: position (-128 to +127), z: depth (1-255)
;   - Projection: sx = x * 256 / z + 128, sy = y * 256 / z + 128
;   - Warp speed: oscillates using TICKS counter
;     speed = 2 + (TICKS >> 6) & 3  -> ranges 2..5
;     Every ~4 seconds at 60fps, speed increases by 1
;     Warp resets after hitting max (cycle 0..15 then wraps)
;   - Streak rendering: compute screen pos at (z) and (z+speed),
;     draw LINE from far pos to near pos = motion blur streak
;   - Brightness = 255 - z (closer = brighter)
;
; Star struct: [x, y, z] = 3 consecutive words
; Memory: 0x4000 + index*3 = base of star[index]
;
; Register convention (main loop):
;   r7  = 1
;   r8  = 128 (screen center)
;   r10 = star index (0-127)
;   r11 = 128 (star count)
;   r12 = 0x4000 (star pool base)
;   r13 = frame counter
;   r14 = 256 (projection scale)
;   r15 = current star base address
;   r6  = warp speed (current z-decrement per frame)

; === Initialize star pool ===
LDI r7, 1
LDI r8, 128
LDI r11, 128
LDI r12, 0x4000
LDI r14, 64             ; projection scale (smaller = wider FOV)
LDI r13, 0
LDI r6, 2               ; initial warp speed

LDI r10, 0               ; star index

init_loop:
  ; r15 = 0x4000 + index * 3
  MOV r15, r10
  LDI r16, 3
  MUL r15, r16
  ADD r15, r12            ; r15 = &star[index]

  ; x = (RAND & 0xFF) - 128  -> range -128..127
  RAND r16
  LDI r17, 0xFF
  AND r16, r17
  LDI r17, 128
  SUB r16, r17            ; r16 = x
  STORE r15, r16          ; star.x at base+0

  ; y = (RAND & 0xFF) - 128
  RAND r16
  LDI r17, 0xFF
  AND r16, r17
  LDI r17, 128
  SUB r16, r17            ; r16 = y
  MOV r17, r15
  ADD r17, r7             ; base+1
  STORE r17, r16          ; star.y at base+1

  ; z = (RAND & 0x7F) + 1 -> range 1..128 (start spread out)
  RAND r16
  LDI r17, 0x7F
  AND r16, r17
  ADD r16, r7             ; 1..128
  MOV r17, r15
  ADD r17, r7
  ADD r17, r7             ; base+2
  STORE r17, r16          ; star.z at base+2

  ADD r10, r7
  CMP r10, r11
  BLT r0, init_loop

; === Main animation loop ===
frame_loop:
  ; Clear screen to black
  LDI r15, 0
  FILL r15

  ; === Speed-controlled warp effect ===
  ; Read TICKS (frame counter via RAM port 0xFFE)
  LDI r20, 0xFFE
  LOAD r20, r20            ; r20 = TICKS (frame_count)
  ; Warp speed cycles: speed = 2 + ((TICKS >> 6) & 3)
  ; >> 6 = divide by 64, so speed changes every ~1 second at 60fps
  ; & 3 cycles 0..3, so speed ranges 2..5
  LDI r21, 6
  SHR r20, r21             ; r20 = TICKS >> 6
  LDI r21, 3
  AND r20, r21             ; r20 = (TICKS >> 6) & 3
  LDI r21, 2
  ADD r20, r21             ; r20 = warp speed = 2..5
  MOV r6, r20              ; r6 = warp speed for this frame

  LDI r10, 0              ; star index

star_loop:
  ; r15 = 0x4000 + index * 3
  MOV r15, r10
  LDI r16, 3
  MUL r15, r16
  ADD r15, r12            ; r15 = &star[index]

  ; Load z from base+2
  MOV r16, r15
  ADD r16, r7
  ADD r16, r7             ; base+2
  LOAD r16, r16           ; r16 = z

  ; If z == 0, recycle
  JZ r16, recycle_star

  ; Load x from base+0
  LOAD r17, r15           ; r17 = x

  ; Project current position: sx = x * scale / z + 128
  MOV r18, r17
  MUL r18, r14            ; r18 = x * 64
  DIV r18, r16            ; r18 = x * 64 / z = sx_raw
  ADD r18, r8             ; r18 = sx

  ; Load y from base+1
  MOV r19, r15
  ADD r19, r7             ; base+1
  LOAD r19, r19           ; r19 = y

  ; Project current position: sy = y * scale / z + 128
  MOV r20, r19
  MUL r20, r14            ; r20 = y * 64
  DIV r20, r16            ; r20 = y * 64 / z = sy_raw
  ADD r20, r8             ; r20 = sy

  ; === Streak rendering ===
  ; Compute "previous" position at z + speed (where star was last frame)
  ; prev_sx = x * scale / (z + speed) + 128
  ; This gives the tail of the motion streak
  MOV r21, r16
  ADD r21, r6             ; r21 = z + speed (previous z)
  MOV r22, r17
  MUL r22, r14            ; r22 = x * 64
  DIV r22, r21            ; r22 = x * 64 / (z + speed)
  ADD r22, r8             ; r22 = prev_sx
  MOV r23, r19
  MUL r23, r14            ; r23 = y * 64
  DIV r23, r21            ; r23 = y * 64 / (z + speed)
  ADD r23, r8             ; r23 = prev_sy

  ; Brightness: 255 - z (closer = brighter)
  LDI r24, 255
  SUB r24, r16            ; r24 = 255 - z

  ; Make grayscale: color = b | (b << 8) | (b << 16)
  MOV r25, r24
  LDI r26, 8
  SHL r25, r26            ; r25 = b << 8
  MOV r26, r24
  LDI r27, 16
  SHL r26, r27            ; r26 = b << 16
  OR r25, r26             ; r25 = (b << 16) | (b << 8)
  OR r25, r24             ; r25 |= b = full gray

  ; === Draw streak LINE from prev to current ===
  ; LINE x0, y0, x1, y1, color
  ; prev position is the tail (farther), current is the head (closer)
  ; Bounds check: if both prev and current are off-screen, skip
  ; If current is on-screen, draw the streak
  PUSH r0

  ; Check current position bounds
  LDI r26, 31
  MOV r27, r18
  SAR r27, r26
  JNZ r27, streak_skip    ; sx negative
  LDI r26, 256
  CMP r18, r26
  BGE r0, streak_skip     ; sx >= 256
  MOV r27, r20
  LDI r26, 31
  SAR r27, r26
  JNZ r27, streak_skip    ; sy negative
  LDI r26, 256
  CMP r20, r26
  BGE r0, streak_skip     ; sy >= 256

  ; Draw LINE from prev to current (motion streak)
  LINE r22, r23, r18, r20, r25
  JMP streak_done

streak_skip:
  ; Star is off-screen, just check prev for recycling
  ; (no draw needed)

streak_done:
  POP r0

  ; Advance z: z -= speed (warp-controlled!)
  MOV r16, r15
  ADD r16, r7
  ADD r16, r7             ; base+2 = &z
  LOAD r21, r16           ; r21 = current z
  MOV r22, r6             ; r22 = warp speed
  SUB r21, r22            ; z -= speed

  ; If z <= speed, recycle (avoid div-by-zero next frame)
  LDI r22, 1
  CMP r21, r22
  BLT r0, recycle_star_z  ; z < 1 -> recycle

  STORE r16, r21          ; save new z
  JMP next_star

recycle_star:
  ; z was 0 on load -- need base address in r15
recycle_star_z:
  ; New x = (RAND & 0xFF) - 128
  RAND r17
  LDI r18, 0xFF
  AND r17, r18
  LDI r18, 128
  SUB r17, r18
  STORE r15, r17          ; star.x

  ; New y = (RAND & 0xFF) - 128
  RAND r17
  LDI r18, 0xFF
  AND r17, r18
  LDI r18, 128
  SUB r17, r18
  MOV r18, r15
  ADD r18, r7             ; base+1
  STORE r18, r17          ; star.y

  ; New z = 255 (far away)
  LDI r17, 255
  MOV r18, r15
  ADD r18, r7
  ADD r18, r7             ; base+2
  STORE r18, r17          ; star.z = 255

next_star:
  ADD r10, r7
  CMP r10, r11
  BLT r0, star_loop

  ; Next frame
  ADD r13, r7
  FRAME
  JMP frame_loop
