; DESCRIPTION: This GeOS assembly code manages a system of 100 colored particles that drift across the screen, bounce off edges, and fade over time. Each particle's state (position, velocity, color, and life) is stored in RAM, and the code updates these states in real-time to create visually dynamic effects.

; particles.asm -- 100 colored pixels that drift, bounce, and fade
;
; Proves FRAME + pixel write performance for real-time effects.
; Each particle has position (x,y), velocity (vx,vy), color, and life.
; Particles bounce off screen edges and fade over time. When life runs
; out, the particle respawns at a random position with fresh color/velocity.
;
; Memory layout (100 particles, 6 words each):
;   RAM[0x8000 + N*6 + 0] = x      (0..255)
;   RAM[0x8000 + N*6 + 1] = y      (0..255)
;   RAM[0x8000 + N*6 + 2] = vx     (signed, -2..+2, nonzero)
;   RAM[0x8000 + N*6 + 3] = vy     (signed, -2..+2, nonzero)
;   RAM[0x8000 + N*6 + 4] = color  (0xRRGGBB)
;   RAM[0x8000 + N*6 + 5] = life   (128..255, decrements each frame)

; ===== Constants =====
LDI r20, 6           ; stride per particle
LDI r21, 100         ; particle count
LDI r22, 256         ; screen size
LDI r23, 0x8000      ; particle base address
LDI r24, 0xFF        ; byte mask
LDI r25, 1           ; constant 1
LDI r26, 0           ; background color (black)

; ===== Initialize 100 particles =====
LDI r1, 0

init_loop:
  CALL calc_addr
  CALL randomize
  ADD r1, r25
  CMP r1, r21
  BLT r14, init_loop

; ===== Main frame loop =====
frame_loop:
  FILL r26            ; clear screen to black
  LDI r1, 0

update_loop:
  CALL calc_addr      ; r15 = base of particle[i]

  ; -- Load x and vx --
  LOAD r6, r15         ; r6 = x
  LDI r11, 2
  ADD r15, r11          ; r15 -> vx
  LOAD r9, r15         ; r9 = vx
  ADD r6, r9          ; x += vx

  ; Bounce X: if x >= 256, it went off screen
  CMP r6, r22
  BLT r14, x_ok
  ; Clamp x and negate vx
  LDI r6, 2
  LOAD r9, r15
  NEG r9
  STORE r15, r9        ; save negated vx
x_ok:
  ; Save x back
  CALL calc_addr
  STORE r15, r6

  ; -- Load y and vy --
  CALL calc_addr
  LDI r11, 1
  ADD r15, r11          ; r15 -> y
  LOAD r5, r15         ; r5 = y
  LDI r11, 1
  ADD r15, r11          ; r15 -> vy
  LOAD r9, r15         ; r9 = vy
  ADD r5, r9          ; y += vy

  ; Bounce Y
  CMP r5, r22
  BLT r14, y_ok
  LDI r5, 2
  LOAD r9, r15
  NEG r9
  STORE r15, r9        ; save negated vy
y_ok:
  ; Save y back
  CALL calc_addr
  LDI r11, 1
  ADD r15, r11
  STORE r15, r5

  ; -- Decrement life --
  CALL calc_addr
  LDI r11, 5
  ADD r15, r11          ; r15 -> life
  LOAD r11, r15
  SUBI r11, 1
  STORE r15, r11

  ; If life > 0, draw
  CMP r11, r26
  BGE r14, do_draw

  ; Life hit 0: respawn
  CALL calc_addr
  CALL randomize
  JMP next_particle

do_draw:
  ; -- Draw with fade --
  CALL calc_addr
  LOAD r6, r15         ; x
  LDI r11, 1
  ADD r15, r11
  LOAD r5, r15         ; y
  LDI r11, 1
  ADD r15, r11          ; skip vy
  LDI r11, 1
  ADD r15, r11          ; -> color
  LOAD r3, r15         ; r3 = color
  LDI r11, 1
  ADD r15, r11          ; -> life
  LOAD r13, r15         ; r13 = life

  ; Compute fade: shift = (255 - life) >> 5 (0..7)
  LDI r11, 255
  SUB r11, r13
  SHRI r11, 5          ; r11 = fade_shift (0..7)
  MOV r13, r11

  ; Fade red
  MOV r12, r3
  SHRI r12, 16
  SHR r12, r13
  SHLI r12, 16
  MOV r11, r12

  ; Fade green
  MOV r12, r3
  SHRI r12, 8
  ANDI r12, 0xFF
  SHR r12, r13
  SHLI r12, 8
  OR r11, r12

  ; Fade blue
  MOV r12, r3
  ANDI r12, 0xFF
  SHR r12, r13
  OR r11, r12           ; r11 = final faded color

  ; Skip if fully faded
  CMP r11, r26
  JZ r14, next_particle

  PSET r6, r5, r11

next_particle:
  ADD r1, r25
  CMP r1, r21
  BLT r14, update_loop

  FRAME
  JMP frame_loop

; ===== Subroutine: calc_addr =====
; Sets r15 = 0x8000 + r1 * 6
calc_addr:
  MOV r15, r1
  MUL r15, r20
  ADD r15, r23
  RET

; ===== Subroutine: randomize =====
; Randomizes particle at address r15
randomize:
  ; x = RAND & 0xFF
  RAND r6
  AND r6, r24
  STORE r15, r6
  ADD r15, r25

  ; y = RAND & 0xFF
  RAND r6
  AND r6, r24
  STORE r15, r6
  ADD r15, r25

  ; vx = (RAND & 3) + 1, randomly negated
  RAND r6
  ANDI r6, 3
  ADDI r6, 1           ; 1..4
  RAND r11
  ANDI r11, 1
  JZ r11, vx_pos
  NEG r6
vx_pos:
  STORE r15, r6
  ADD r15, r25

  ; vy = same
  RAND r6
  ANDI r6, 3
  ADDI r6, 1
  RAND r11
  ANDI r11, 1
  JZ r11, vy_pos
  NEG r6
vy_pos:
  STORE r15, r6
  ADD r15, r25

  ; color = RAND | 0x404040 (ensure bright enough)
  RAND r6
  LDI r11, 0x404040
  OR r6, r11
  STORE r15, r6
  ADD r15, r25

  ; life = 128 + (RAND & 127)
  RAND r6
  ANDI r6, 127
  ADDI r6, 128
  STORE r15, r6

  RET
