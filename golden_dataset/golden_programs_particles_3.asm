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
LDI r14, 0

init_loop:
  CALL calc_addr
  CALL randomize
  ADD r14, r25
  CMP r14, r21
  BLT r8, init_loop

; ===== Main frame loop =====
frame_loop:
  FILL r26            ; clear screen to black
  LDI r14, 0

update_loop:
  CALL calc_addr      ; r6 = base of particle[i]

  ; -- Load x and vx --
  LOAD r11, r6         ; r11 = x
  LDI r15, 2
  ADD r6, r15          ; r6 -> vx
  LOAD r2, r6         ; r2 = vx
  ADD r11, r2          ; x += vx

  ; Bounce X: if x >= 256, it went off screen
  CMP r11, r22
  BLT r8, x_ok
  ; Clamp x and negate vx
  LDI r11, 2
  LOAD r2, r6
  NEG r2
  STORE r6, r2        ; save negated vx
x_ok:
  ; Save x back
  CALL calc_addr
  STORE r6, r11

  ; -- Load y and vy --
  CALL calc_addr
  LDI r15, 1
  ADD r6, r15          ; r6 -> y
  LOAD r1, r6         ; r1 = y
  LDI r15, 1
  ADD r6, r15          ; r6 -> vy
  LOAD r2, r6         ; r2 = vy
  ADD r1, r2          ; y += vy

  ; Bounce Y
  CMP r1, r22
  BLT r8, y_ok
  LDI r1, 2
  LOAD r2, r6
  NEG r2
  STORE r6, r2        ; save negated vy
y_ok:
  ; Save y back
  CALL calc_addr
  LDI r15, 1
  ADD r6, r15
  STORE r6, r1

  ; -- Decrement life --
  CALL calc_addr
  LDI r15, 5
  ADD r6, r15          ; r6 -> life
  LOAD r15, r6
  SUBI r15, 1
  STORE r6, r15

  ; If life > 0, draw
  CMP r15, r26
  BGE r8, do_draw

  ; Life hit 0: respawn
  CALL calc_addr
  CALL randomize
  JMP next_particle

do_draw:
  ; -- Draw with fade --
  CALL calc_addr
  LOAD r11, r6         ; x
  LDI r15, 1
  ADD r6, r15
  LOAD r1, r6         ; y
  LDI r15, 1
  ADD r6, r15          ; skip vy
  LDI r15, 1
  ADD r6, r15          ; -> color
  LOAD r4, r6         ; r4 = color
  LDI r15, 1
  ADD r6, r15          ; -> life
  LOAD r0, r6         ; r0 = life

  ; Compute fade: shift = (255 - life) >> 5 (0..7)
  LDI r15, 255
  SUB r15, r0
  SHRI r15, 5          ; r15 = fade_shift (0..7)
  MOV r0, r15

  ; Fade red
  MOV r9, r4
  SHRI r9, 16
  SHR r9, r0
  SHLI r9, 16
  MOV r15, r9

  ; Fade green
  MOV r9, r4
  SHRI r9, 8
  ANDI r9, 0xFF
  SHR r9, r0
  SHLI r9, 8
  OR r15, r9

  ; Fade blue
  MOV r9, r4
  ANDI r9, 0xFF
  SHR r9, r0
  OR r15, r9           ; r15 = final faded color

  ; Skip if fully faded
  CMP r15, r26
  JZ r8, next_particle

  PSET r11, r1, r15

next_particle:
  ADD r14, r25
  CMP r14, r21
  BLT r8, update_loop

  FRAME
  JMP frame_loop

; ===== Subroutine: calc_addr =====
; Sets r6 = 0x8000 + r14 * 6
calc_addr:
  MOV r6, r14
  MUL r6, r20
  ADD r6, r23
  RET

; ===== Subroutine: randomize =====
; Randomizes particle at address r6
randomize:
  ; x = RAND & 0xFF
  RAND r11
  AND r11, r24
  STORE r6, r11
  ADD r6, r25

  ; y = RAND & 0xFF
  RAND r11
  AND r11, r24
  STORE r6, r11
  ADD r6, r25

  ; vx = (RAND & 3) + 1, randomly negated
  RAND r11
  ANDI r11, 3
  ADDI r11, 1           ; 1..4
  RAND r15
  ANDI r15, 1
  JZ r15, vx_pos
  NEG r11
vx_pos:
  STORE r6, r11
  ADD r6, r25

  ; vy = same
  RAND r11
  ANDI r11, 3
  ADDI r11, 1
  RAND r15
  ANDI r15, 1
  JZ r15, vy_pos
  NEG r11
vy_pos:
  STORE r6, r11
  ADD r6, r25

  ; color = RAND | 0x404040 (ensure bright enough)
  RAND r11
  LDI r15, 0x404040
  OR r11, r15
  STORE r6, r11
  ADD r6, r25

  ; life = 128 + (RAND & 127)
  RAND r11
  ANDI r11, 127
  ADDI r11, 128
  STORE r6, r11

  RET
