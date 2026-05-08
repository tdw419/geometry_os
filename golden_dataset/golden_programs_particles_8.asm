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
LDI r2, 0

init_loop:
  CALL calc_addr
  CALL randomize
  ADD r2, r25
  CMP r2, r21
  BLT r13, init_loop

; ===== Main frame loop =====
frame_loop:
  FILL r26            ; clear screen to black
  LDI r2, 0

update_loop:
  CALL calc_addr      ; r4 = base of particle[i]

  ; -- Load x and vx --
  LOAD r3, r4         ; r3 = x
  LDI r15, 2
  ADD r4, r15          ; r4 -> vx
  LOAD r6, r4         ; r6 = vx
  ADD r3, r6          ; x += vx

  ; Bounce X: if x >= 256, it went off screen
  CMP r3, r22
  BLT r13, x_ok
  ; Clamp x and negate vx
  LDI r3, 2
  LOAD r6, r4
  NEG r6
  STORE r4, r6        ; save negated vx
x_ok:
  ; Save x back
  CALL calc_addr
  STORE r4, r3

  ; -- Load y and vy --
  CALL calc_addr
  LDI r15, 1
  ADD r4, r15          ; r4 -> y
  LOAD r8, r4         ; r8 = y
  LDI r15, 1
  ADD r4, r15          ; r4 -> vy
  LOAD r6, r4         ; r6 = vy
  ADD r8, r6          ; y += vy

  ; Bounce Y
  CMP r8, r22
  BLT r13, y_ok
  LDI r8, 2
  LOAD r6, r4
  NEG r6
  STORE r4, r6        ; save negated vy
y_ok:
  ; Save y back
  CALL calc_addr
  LDI r15, 1
  ADD r4, r15
  STORE r4, r8

  ; -- Decrement life --
  CALL calc_addr
  LDI r15, 5
  ADD r4, r15          ; r4 -> life
  LOAD r15, r4
  SUBI r15, 1
  STORE r4, r15

  ; If life > 0, draw
  CMP r15, r26
  BGE r13, do_draw

  ; Life hit 0: respawn
  CALL calc_addr
  CALL randomize
  JMP next_particle

do_draw:
  ; -- Draw with fade --
  CALL calc_addr
  LOAD r3, r4         ; x
  LDI r15, 1
  ADD r4, r15
  LOAD r8, r4         ; y
  LDI r15, 1
  ADD r4, r15          ; skip vy
  LDI r15, 1
  ADD r4, r15          ; -> color
  LOAD r11, r4         ; r11 = color
  LDI r15, 1
  ADD r4, r15          ; -> life
  LOAD r1, r4         ; r1 = life

  ; Compute fade: shift = (255 - life) >> 5 (0..7)
  LDI r15, 255
  SUB r15, r1
  SHRI r15, 5          ; r15 = fade_shift (0..7)
  MOV r1, r15

  ; Fade red
  MOV r14, r11
  SHRI r14, 16
  SHR r14, r1
  SHLI r14, 16
  MOV r15, r14

  ; Fade green
  MOV r14, r11
  SHRI r14, 8
  ANDI r14, 0xFF
  SHR r14, r1
  SHLI r14, 8
  OR r15, r14

  ; Fade blue
  MOV r14, r11
  ANDI r14, 0xFF
  SHR r14, r1
  OR r15, r14           ; r15 = final faded color

  ; Skip if fully faded
  CMP r15, r26
  JZ r13, next_particle

  PSET r3, r8, r15

next_particle:
  ADD r2, r25
  CMP r2, r21
  BLT r13, update_loop

  FRAME
  JMP frame_loop

; ===== Subroutine: calc_addr =====
; Sets r4 = 0x8000 + r2 * 6
calc_addr:
  MOV r4, r2
  MUL r4, r20
  ADD r4, r23
  RET

; ===== Subroutine: randomize =====
; Randomizes particle at address r4
randomize:
  ; x = RAND & 0xFF
  RAND r3
  AND r3, r24
  STORE r4, r3
  ADD r4, r25

  ; y = RAND & 0xFF
  RAND r3
  AND r3, r24
  STORE r4, r3
  ADD r4, r25

  ; vx = (RAND & 3) + 1, randomly negated
  RAND r3
  ANDI r3, 3
  ADDI r3, 1           ; 1..4
  RAND r15
  ANDI r15, 1
  JZ r15, vx_pos
  NEG r3
vx_pos:
  STORE r4, r3
  ADD r4, r25

  ; vy = same
  RAND r3
  ANDI r3, 3
  ADDI r3, 1
  RAND r15
  ANDI r15, 1
  JZ r15, vy_pos
  NEG r3
vy_pos:
  STORE r4, r3
  ADD r4, r25

  ; color = RAND | 0x404040 (ensure bright enough)
  RAND r3
  LDI r15, 0x404040
  OR r3, r15
  STORE r4, r3
  ADD r4, r25

  ; life = 128 + (RAND & 127)
  RAND r3
  ANDI r3, 127
  ADDI r3, 128
  STORE r4, r3

  RET
