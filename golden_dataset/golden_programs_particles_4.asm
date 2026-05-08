; DESCRIPTION: Render a red object at the screen.

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
  BLT r15, init_loop

; ===== Main frame loop =====
frame_loop:
  FILL r26            ; clear screen to black
  LDI r1, 0

update_loop:
  CALL calc_addr      ; r6 = base of particle[i]

  ; -- Load x and vx --
  LOAD r5, r6         ; r5 = x
  LDI r8, 2
  ADD r6, r8          ; r6 -> vx
  LOAD r13, r6         ; r13 = vx
  ADD r5, r13          ; x += vx

  ; Bounce X: if x >= 256, it went off screen
  CMP r5, r22
  BLT r15, x_ok
  ; Clamp x and negate vx
  LDI r5, 2
  LOAD r13, r6
  NEG r13
  STORE r6, r13        ; save negated vx
x_ok:
  ; Save x back
  CALL calc_addr
  STORE r6, r5

  ; -- Load y and vy --
  CALL calc_addr
  LDI r8, 1
  ADD r6, r8          ; r6 -> y
  LOAD r14, r6         ; r14 = y
  LDI r8, 1
  ADD r6, r8          ; r6 -> vy
  LOAD r13, r6         ; r13 = vy
  ADD r14, r13          ; y += vy

  ; Bounce Y
  CMP r14, r22
  BLT r15, y_ok
  LDI r14, 2
  LOAD r13, r6
  NEG r13
  STORE r6, r13        ; save negated vy
y_ok:
  ; Save y back
  CALL calc_addr
  LDI r8, 1
  ADD r6, r8
  STORE r6, r14

  ; -- Decrement life --
  CALL calc_addr
  LDI r8, 5
  ADD r6, r8          ; r6 -> life
  LOAD r8, r6
  SUBI r8, 1
  STORE r6, r8

  ; If life > 0, draw
  CMP r8, r26
  BGE r15, do_draw

  ; Life hit 0: respawn
  CALL calc_addr
  CALL randomize
  JMP next_particle

do_draw:
  ; -- Draw with fade --
  CALL calc_addr
  LOAD r5, r6         ; x
  LDI r8, 1
  ADD r6, r8
  LOAD r14, r6         ; y
  LDI r8, 1
  ADD r6, r8          ; skip vy
  LDI r8, 1
  ADD r6, r8          ; -> color
  LOAD r3, r6         ; r3 = color
  LDI r8, 1
  ADD r6, r8          ; -> life
  LOAD r12, r6         ; r12 = life

  ; Compute fade: shift = (255 - life) >> 5 (0..7)
  LDI r8, 255
  SUB r8, r12
  SHRI r8, 5          ; r8 = fade_shift (0..7)
  MOV r12, r8

  ; Fade red
  MOV r10, r3
  SHRI r10, 16
  SHR r10, r12
  SHLI r10, 16
  MOV r8, r10

  ; Fade green
  MOV r10, r3
  SHRI r10, 8
  ANDI r10, 0xFF
  SHR r10, r12
  SHLI r10, 8
  OR r8, r10

  ; Fade blue
  MOV r10, r3
  ANDI r10, 0xFF
  SHR r10, r12
  OR r8, r10           ; r8 = final faded color

  ; Skip if fully faded
  CMP r8, r26
  JZ r15, next_particle

  PSET r5, r14, r8

next_particle:
  ADD r1, r25
  CMP r1, r21
  BLT r15, update_loop

  FRAME
  JMP frame_loop

; ===== Subroutine: calc_addr =====
; Sets r6 = 0x8000 + r1 * 6
calc_addr:
  MOV r6, r1
  MUL r6, r20
  ADD r6, r23
  RET

; ===== Subroutine: randomize =====
; Randomizes particle at address r6
randomize:
  ; x = RAND & 0xFF
  RAND r5
  AND r5, r24
  STORE r6, r5
  ADD r6, r25

  ; y = RAND & 0xFF
  RAND r5
  AND r5, r24
  STORE r6, r5
  ADD r6, r25

  ; vx = (RAND & 3) + 1, randomly negated
  RAND r5
  ANDI r5, 3
  ADDI r5, 1           ; 1..4
  RAND r8
  ANDI r8, 1
  JZ r8, vx_pos
  NEG r5
vx_pos:
  STORE r6, r5
  ADD r6, r25

  ; vy = same
  RAND r5
  ANDI r5, 3
  ADDI r5, 1
  RAND r8
  ANDI r8, 1
  JZ r8, vy_pos
  NEG r5
vy_pos:
  STORE r6, r5
  ADD r6, r25

  ; color = RAND | 0x404040 (ensure bright enough)
  RAND r5
  LDI r8, 0x404040
  OR r5, r8
  STORE r6, r5
  ADD r6, r25

  ; life = 128 + (RAND & 127)
  RAND r5
  ANDI r5, 127
  ADDI r5, 128
  STORE r6, r5

  RET
