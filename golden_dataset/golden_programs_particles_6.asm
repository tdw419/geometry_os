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
LDI r7, 0

init_loop:
  CALL calc_addr
  CALL randomize
  ADD r7, r25
  CMP r7, r21
  BLT r6, init_loop

; ===== Main frame loop =====
frame_loop:
  FILL r26            ; clear screen to black
  LDI r7, 0

update_loop:
  CALL calc_addr      ; r3 = base of particle[i]

  ; -- Load x and vx --
  LOAD r12, r3         ; r12 = x
  LDI r13, 2
  ADD r3, r13          ; r3 -> vx
  LOAD r15, r3         ; r15 = vx
  ADD r12, r15          ; x += vx

  ; Bounce X: if x >= 256, it went off screen
  CMP r12, r22
  BLT r6, x_ok
  ; Clamp x and negate vx
  LDI r12, 2
  LOAD r15, r3
  NEG r15
  STORE r3, r15        ; save negated vx
x_ok:
  ; Save x back
  CALL calc_addr
  STORE r3, r12

  ; -- Load y and vy --
  CALL calc_addr
  LDI r13, 1
  ADD r3, r13          ; r3 -> y
  LOAD r9, r3         ; r9 = y
  LDI r13, 1
  ADD r3, r13          ; r3 -> vy
  LOAD r15, r3         ; r15 = vy
  ADD r9, r15          ; y += vy

  ; Bounce Y
  CMP r9, r22
  BLT r6, y_ok
  LDI r9, 2
  LOAD r15, r3
  NEG r15
  STORE r3, r15        ; save negated vy
y_ok:
  ; Save y back
  CALL calc_addr
  LDI r13, 1
  ADD r3, r13
  STORE r3, r9

  ; -- Decrement life --
  CALL calc_addr
  LDI r13, 5
  ADD r3, r13          ; r3 -> life
  LOAD r13, r3
  SUBI r13, 1
  STORE r3, r13

  ; If life > 0, draw
  CMP r13, r26
  BGE r6, do_draw

  ; Life hit 0: respawn
  CALL calc_addr
  CALL randomize
  JMP next_particle

do_draw:
  ; -- Draw with fade --
  CALL calc_addr
  LOAD r12, r3         ; x
  LDI r13, 1
  ADD r3, r13
  LOAD r9, r3         ; y
  LDI r13, 1
  ADD r3, r13          ; skip vy
  LDI r13, 1
  ADD r3, r13          ; -> color
  LOAD r11, r3         ; r11 = color
  LDI r13, 1
  ADD r3, r13          ; -> life
  LOAD r8, r3         ; r8 = life

  ; Compute fade: shift = (255 - life) >> 5 (0..7)
  LDI r13, 255
  SUB r13, r8
  SHRI r13, 5          ; r13 = fade_shift (0..7)
  MOV r8, r13

  ; Fade red
  MOV r4, r11
  SHRI r4, 16
  SHR r4, r8
  SHLI r4, 16
  MOV r13, r4

  ; Fade green
  MOV r4, r11
  SHRI r4, 8
  ANDI r4, 0xFF
  SHR r4, r8
  SHLI r4, 8
  OR r13, r4

  ; Fade blue
  MOV r4, r11
  ANDI r4, 0xFF
  SHR r4, r8
  OR r13, r4           ; r13 = final faded color

  ; Skip if fully faded
  CMP r13, r26
  JZ r6, next_particle

  PSET r12, r9, r13

next_particle:
  ADD r7, r25
  CMP r7, r21
  BLT r6, update_loop

  FRAME
  JMP frame_loop

; ===== Subroutine: calc_addr =====
; Sets r3 = 0x8000 + r7 * 6
calc_addr:
  MOV r3, r7
  MUL r3, r20
  ADD r3, r23
  RET

; ===== Subroutine: randomize =====
; Randomizes particle at address r3
randomize:
  ; x = RAND & 0xFF
  RAND r12
  AND r12, r24
  STORE r3, r12
  ADD r3, r25

  ; y = RAND & 0xFF
  RAND r12
  AND r12, r24
  STORE r3, r12
  ADD r3, r25

  ; vx = (RAND & 3) + 1, randomly negated
  RAND r12
  ANDI r12, 3
  ADDI r12, 1           ; 1..4
  RAND r13
  ANDI r13, 1
  JZ r13, vx_pos
  NEG r12
vx_pos:
  STORE r3, r12
  ADD r3, r25

  ; vy = same
  RAND r12
  ANDI r12, 3
  ADDI r12, 1
  RAND r13
  ANDI r13, 1
  JZ r13, vy_pos
  NEG r12
vy_pos:
  STORE r3, r12
  ADD r3, r25

  ; color = RAND | 0x404040 (ensure bright enough)
  RAND r12
  LDI r13, 0x404040
  OR r12, r13
  STORE r3, r12
  ADD r3, r25

  ; life = 128 + (RAND & 127)
  RAND r12
  ANDI r12, 127
  ADDI r12, 128
  STORE r3, r12

  RET
