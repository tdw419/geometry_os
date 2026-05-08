; DESCRIPTION: A red object centered at the screen with fixed size.

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
LDI r15, 0

init_loop:
  CALL calc_addr
  CALL randomize
  ADD r15, r25
  CMP r15, r21
  BLT r2, init_loop

; ===== Main frame loop =====
frame_loop:
  FILL r26            ; clear screen to black
  LDI r15, 0

update_loop:
  CALL calc_addr      ; r13 = base of particle[i]

  ; -- Load x and vx --
  LOAD r5, r13         ; r5 = x
  LDI r4, 2
  ADD r13, r4          ; r13 -> vx
  LOAD r14, r13         ; r14 = vx
  ADD r5, r14          ; x += vx

  ; Bounce X: if x >= 256, it went off screen
  CMP r5, r22
  BLT r2, x_ok
  ; Clamp x and negate vx
  LDI r5, 2
  LOAD r14, r13
  NEG r14
  STORE r13, r14        ; save negated vx
x_ok:
  ; Save x back
  CALL calc_addr
  STORE r13, r5

  ; -- Load y and vy --
  CALL calc_addr
  LDI r4, 1
  ADD r13, r4          ; r13 -> y
  LOAD r10, r13         ; r10 = y
  LDI r4, 1
  ADD r13, r4          ; r13 -> vy
  LOAD r14, r13         ; r14 = vy
  ADD r10, r14          ; y += vy

  ; Bounce Y
  CMP r10, r22
  BLT r2, y_ok
  LDI r10, 2
  LOAD r14, r13
  NEG r14
  STORE r13, r14        ; save negated vy
y_ok:
  ; Save y back
  CALL calc_addr
  LDI r4, 1
  ADD r13, r4
  STORE r13, r10

  ; -- Decrement life --
  CALL calc_addr
  LDI r4, 5
  ADD r13, r4          ; r13 -> life
  LOAD r4, r13
  SUBI r4, 1
  STORE r13, r4

  ; If life > 0, draw
  CMP r4, r26
  BGE r2, do_draw

  ; Life hit 0: respawn
  CALL calc_addr
  CALL randomize
  JMP next_particle

do_draw:
  ; -- Draw with fade --
  CALL calc_addr
  LOAD r5, r13         ; x
  LDI r4, 1
  ADD r13, r4
  LOAD r10, r13         ; y
  LDI r4, 1
  ADD r13, r4          ; skip vy
  LDI r4, 1
  ADD r13, r4          ; -> color
  LOAD r6, r13         ; r6 = color
  LDI r4, 1
  ADD r13, r4          ; -> life
  LOAD r3, r13         ; r3 = life

  ; Compute fade: shift = (255 - life) >> 5 (0..7)
  LDI r4, 255
  SUB r4, r3
  SHRI r4, 5          ; r4 = fade_shift (0..7)
  MOV r3, r4

  ; Fade red
  MOV r8, r6
  SHRI r8, 16
  SHR r8, r3
  SHLI r8, 16
  MOV r4, r8

  ; Fade green
  MOV r8, r6
  SHRI r8, 8
  ANDI r8, 0xFF
  SHR r8, r3
  SHLI r8, 8
  OR r4, r8

  ; Fade blue
  MOV r8, r6
  ANDI r8, 0xFF
  SHR r8, r3
  OR r4, r8           ; r4 = final faded color

  ; Skip if fully faded
  CMP r4, r26
  JZ r2, next_particle

  PSET r5, r10, r4

next_particle:
  ADD r15, r25
  CMP r15, r21
  BLT r2, update_loop

  FRAME
  JMP frame_loop

; ===== Subroutine: calc_addr =====
; Sets r13 = 0x8000 + r15 * 6
calc_addr:
  MOV r13, r15
  MUL r13, r20
  ADD r13, r23
  RET

; ===== Subroutine: randomize =====
; Randomizes particle at address r13
randomize:
  ; x = RAND & 0xFF
  RAND r5
  AND r5, r24
  STORE r13, r5
  ADD r13, r25

  ; y = RAND & 0xFF
  RAND r5
  AND r5, r24
  STORE r13, r5
  ADD r13, r25

  ; vx = (RAND & 3) + 1, randomly negated
  RAND r5
  ANDI r5, 3
  ADDI r5, 1           ; 1..4
  RAND r4
  ANDI r4, 1
  JZ r4, vx_pos
  NEG r5
vx_pos:
  STORE r13, r5
  ADD r13, r25

  ; vy = same
  RAND r5
  ANDI r5, 3
  ADDI r5, 1
  RAND r4
  ANDI r4, 1
  JZ r4, vy_pos
  NEG r5
vy_pos:
  STORE r13, r5
  ADD r13, r25

  ; color = RAND | 0x404040 (ensure bright enough)
  RAND r5
  LDI r4, 0x404040
  OR r5, r4
  STORE r13, r5
  ADD r13, r25

  ; life = 128 + (RAND & 127)
  RAND r5
  ANDI r5, 127
  ADDI r5, 128
  STORE r13, r5

  RET
