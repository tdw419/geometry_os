; DESCRIPTION: Display a object using color red at the screen.

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
LDI r12, 0

init_loop:
  CALL calc_addr
  CALL randomize
  ADD r12, r25
  CMP r12, r21
  BLT r7, init_loop

; ===== Main frame loop =====
frame_loop:
  FILL r26            ; clear screen to black
  LDI r12, 0

update_loop:
  CALL calc_addr      ; r13 = base of particle[i]

  ; -- Load x and vx --
  LOAD r1, r13         ; r1 = x
  LDI r11, 2
  ADD r13, r11          ; r13 -> vx
  LOAD r15, r13         ; r15 = vx
  ADD r1, r15          ; x += vx

  ; Bounce X: if x >= 256, it went off screen
  CMP r1, r22
  BLT r7, x_ok
  ; Clamp x and negate vx
  LDI r1, 2
  LOAD r15, r13
  NEG r15
  STORE r13, r15        ; save negated vx
x_ok:
  ; Save x back
  CALL calc_addr
  STORE r13, r1

  ; -- Load y and vy --
  CALL calc_addr
  LDI r11, 1
  ADD r13, r11          ; r13 -> y
  LOAD r3, r13         ; r3 = y
  LDI r11, 1
  ADD r13, r11          ; r13 -> vy
  LOAD r15, r13         ; r15 = vy
  ADD r3, r15          ; y += vy

  ; Bounce Y
  CMP r3, r22
  BLT r7, y_ok
  LDI r3, 2
  LOAD r15, r13
  NEG r15
  STORE r13, r15        ; save negated vy
y_ok:
  ; Save y back
  CALL calc_addr
  LDI r11, 1
  ADD r13, r11
  STORE r13, r3

  ; -- Decrement life --
  CALL calc_addr
  LDI r11, 5
  ADD r13, r11          ; r13 -> life
  LOAD r11, r13
  SUBI r11, 1
  STORE r13, r11

  ; If life > 0, draw
  CMP r11, r26
  BGE r7, do_draw

  ; Life hit 0: respawn
  CALL calc_addr
  CALL randomize
  JMP next_particle

do_draw:
  ; -- Draw with fade --
  CALL calc_addr
  LOAD r1, r13         ; x
  LDI r11, 1
  ADD r13, r11
  LOAD r3, r13         ; y
  LDI r11, 1
  ADD r13, r11          ; skip vy
  LDI r11, 1
  ADD r13, r11          ; -> color
  LOAD r14, r13         ; r14 = color
  LDI r11, 1
  ADD r13, r11          ; -> life
  LOAD r8, r13         ; r8 = life

  ; Compute fade: shift = (255 - life) >> 5 (0..7)
  LDI r11, 255
  SUB r11, r8
  SHRI r11, 5          ; r11 = fade_shift (0..7)
  MOV r8, r11

  ; Fade red
  MOV r10, r14
  SHRI r10, 16
  SHR r10, r8
  SHLI r10, 16
  MOV r11, r10

  ; Fade green
  MOV r10, r14
  SHRI r10, 8
  ANDI r10, 0xFF
  SHR r10, r8
  SHLI r10, 8
  OR r11, r10

  ; Fade blue
  MOV r10, r14
  ANDI r10, 0xFF
  SHR r10, r8
  OR r11, r10           ; r11 = final faded color

  ; Skip if fully faded
  CMP r11, r26
  JZ r7, next_particle

  PSET r1, r3, r11

next_particle:
  ADD r12, r25
  CMP r12, r21
  BLT r7, update_loop

  FRAME
  JMP frame_loop

; ===== Subroutine: calc_addr =====
; Sets r13 = 0x8000 + r12 * 6
calc_addr:
  MOV r13, r12
  MUL r13, r20
  ADD r13, r23
  RET

; ===== Subroutine: randomize =====
; Randomizes particle at address r13
randomize:
  ; x = RAND & 0xFF
  RAND r1
  AND r1, r24
  STORE r13, r1
  ADD r13, r25

  ; y = RAND & 0xFF
  RAND r1
  AND r1, r24
  STORE r13, r1
  ADD r13, r25

  ; vx = (RAND & 3) + 1, randomly negated
  RAND r1
  ANDI r1, 3
  ADDI r1, 1           ; 1..4
  RAND r11
  ANDI r11, 1
  JZ r11, vx_pos
  NEG r1
vx_pos:
  STORE r13, r1
  ADD r13, r25

  ; vy = same
  RAND r1
  ANDI r1, 3
  ADDI r1, 1
  RAND r11
  ANDI r11, 1
  JZ r11, vy_pos
  NEG r1
vy_pos:
  STORE r13, r1
  ADD r13, r25

  ; color = RAND | 0x404040 (ensure bright enough)
  RAND r1
  LDI r11, 0x404040
  OR r1, r11
  STORE r13, r1
  ADD r13, r25

  ; life = 128 + (RAND & 127)
  RAND r1
  ANDI r1, 127
  ADDI r1, 128
  STORE r13, r1

  RET
