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
LDI r5, 0

init_loop:
  CALL calc_addr
  CALL randomize
  ADD r5, r25
  CMP r5, r21
  BLT r12, init_loop

; ===== Main frame loop =====
frame_loop:
  FILL r26            ; clear screen to black
  LDI r5, 0

update_loop:
  CALL calc_addr      ; r1 = base of particle[i]

  ; -- Load x and vx --
  LOAD r2, r1         ; r2 = x
  LDI r13, 2
  ADD r1, r13          ; r1 -> vx
  LOAD r6, r1         ; r6 = vx
  ADD r2, r6          ; x += vx

  ; Bounce X: if x >= 256, it went off screen
  CMP r2, r22
  BLT r12, x_ok
  ; Clamp x and negate vx
  LDI r2, 2
  LOAD r6, r1
  NEG r6
  STORE r1, r6        ; save negated vx
x_ok:
  ; Save x back
  CALL calc_addr
  STORE r1, r2

  ; -- Load y and vy --
  CALL calc_addr
  LDI r13, 1
  ADD r1, r13          ; r1 -> y
  LOAD r0, r1         ; r0 = y
  LDI r13, 1
  ADD r1, r13          ; r1 -> vy
  LOAD r6, r1         ; r6 = vy
  ADD r0, r6          ; y += vy

  ; Bounce Y
  CMP r0, r22
  BLT r12, y_ok
  LDI r0, 2
  LOAD r6, r1
  NEG r6
  STORE r1, r6        ; save negated vy
y_ok:
  ; Save y back
  CALL calc_addr
  LDI r13, 1
  ADD r1, r13
  STORE r1, r0

  ; -- Decrement life --
  CALL calc_addr
  LDI r13, 5
  ADD r1, r13          ; r1 -> life
  LOAD r13, r1
  SUBI r13, 1
  STORE r1, r13

  ; If life > 0, draw
  CMP r13, r26
  BGE r12, do_draw

  ; Life hit 0: respawn
  CALL calc_addr
  CALL randomize
  JMP next_particle

do_draw:
  ; -- Draw with fade --
  CALL calc_addr
  LOAD r2, r1         ; x
  LDI r13, 1
  ADD r1, r13
  LOAD r0, r1         ; y
  LDI r13, 1
  ADD r1, r13          ; skip vy
  LDI r13, 1
  ADD r1, r13          ; -> color
  LOAD r3, r1         ; r3 = color
  LDI r13, 1
  ADD r1, r13          ; -> life
  LOAD r14, r1         ; r14 = life

  ; Compute fade: shift = (255 - life) >> 5 (0..7)
  LDI r13, 255
  SUB r13, r14
  SHRI r13, 5          ; r13 = fade_shift (0..7)
  MOV r14, r13

  ; Fade red
  MOV r4, r3
  SHRI r4, 16
  SHR r4, r14
  SHLI r4, 16
  MOV r13, r4

  ; Fade green
  MOV r4, r3
  SHRI r4, 8
  ANDI r4, 0xFF
  SHR r4, r14
  SHLI r4, 8
  OR r13, r4

  ; Fade blue
  MOV r4, r3
  ANDI r4, 0xFF
  SHR r4, r14
  OR r13, r4           ; r13 = final faded color

  ; Skip if fully faded
  CMP r13, r26
  JZ r12, next_particle

  PSET r2, r0, r13

next_particle:
  ADD r5, r25
  CMP r5, r21
  BLT r12, update_loop

  FRAME
  JMP frame_loop

; ===== Subroutine: calc_addr =====
; Sets r1 = 0x8000 + r5 * 6
calc_addr:
  MOV r1, r5
  MUL r1, r20
  ADD r1, r23
  RET

; ===== Subroutine: randomize =====
; Randomizes particle at address r1
randomize:
  ; x = RAND & 0xFF
  RAND r2
  AND r2, r24
  STORE r1, r2
  ADD r1, r25

  ; y = RAND & 0xFF
  RAND r2
  AND r2, r24
  STORE r1, r2
  ADD r1, r25

  ; vx = (RAND & 3) + 1, randomly negated
  RAND r2
  ANDI r2, 3
  ADDI r2, 1           ; 1..4
  RAND r13
  ANDI r13, 1
  JZ r13, vx_pos
  NEG r2
vx_pos:
  STORE r1, r2
  ADD r1, r25

  ; vy = same
  RAND r2
  ANDI r2, 3
  ADDI r2, 1
  RAND r13
  ANDI r13, 1
  JZ r13, vy_pos
  NEG r2
vy_pos:
  STORE r1, r2
  ADD r1, r25

  ; color = RAND | 0x404040 (ensure bright enough)
  RAND r2
  LDI r13, 0x404040
  OR r2, r13
  STORE r1, r2
  ADD r1, r25

  ; life = 128 + (RAND & 127)
  RAND r2
  ANDI r2, 127
  ADDI r2, 128
  STORE r1, r2

  RET
