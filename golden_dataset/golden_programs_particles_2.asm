; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

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
LDI r0, 0

init_loop:
  CALL calc_addr
  CALL randomize
  ADD r0, r25
  CMP r0, r21
  BLT r14, init_loop

; ===== Main frame loop =====
frame_loop:
  FILL r26            ; clear screen to black
  LDI r0, 0

update_loop:
  CALL calc_addr      ; r11 = base of particle[i]

  ; -- Load x and vx --
  LOAD r13, r11         ; r13 = x
  LDI r10, 2
  ADD r11, r10          ; r11 -> vx
  LOAD r15, r11         ; r15 = vx
  ADD r13, r15          ; x += vx

  ; Bounce X: if x >= 256, it went off screen
  CMP r13, r22
  BLT r14, x_ok
  ; Clamp x and negate vx
  LDI r13, 2
  LOAD r15, r11
  NEG r15
  STORE r11, r15        ; save negated vx
x_ok:
  ; Save x back
  CALL calc_addr
  STORE r11, r13

  ; -- Load y and vy --
  CALL calc_addr
  LDI r10, 1
  ADD r11, r10          ; r11 -> y
  LOAD r6, r11         ; r6 = y
  LDI r10, 1
  ADD r11, r10          ; r11 -> vy
  LOAD r15, r11         ; r15 = vy
  ADD r6, r15          ; y += vy

  ; Bounce Y
  CMP r6, r22
  BLT r14, y_ok
  LDI r6, 2
  LOAD r15, r11
  NEG r15
  STORE r11, r15        ; save negated vy
y_ok:
  ; Save y back
  CALL calc_addr
  LDI r10, 1
  ADD r11, r10
  STORE r11, r6

  ; -- Decrement life --
  CALL calc_addr
  LDI r10, 5
  ADD r11, r10          ; r11 -> life
  LOAD r10, r11
  SUBI r10, 1
  STORE r11, r10

  ; If life > 0, draw
  CMP r10, r26
  BGE r14, do_draw

  ; Life hit 0: respawn
  CALL calc_addr
  CALL randomize
  JMP next_particle

do_draw:
  ; -- Draw with fade --
  CALL calc_addr
  LOAD r13, r11         ; x
  LDI r10, 1
  ADD r11, r10
  LOAD r6, r11         ; y
  LDI r10, 1
  ADD r11, r10          ; skip vy
  LDI r10, 1
  ADD r11, r10          ; -> color
  LOAD r9, r11         ; r9 = color
  LDI r10, 1
  ADD r11, r10          ; -> life
  LOAD r12, r11         ; r12 = life

  ; Compute fade: shift = (255 - life) >> 5 (0..7)
  LDI r10, 255
  SUB r10, r12
  SHRI r10, 5          ; r10 = fade_shift (0..7)
  MOV r12, r10

  ; Fade red
  MOV r7, r9
  SHRI r7, 16
  SHR r7, r12
  SHLI r7, 16
  MOV r10, r7

  ; Fade green
  MOV r7, r9
  SHRI r7, 8
  ANDI r7, 0xFF
  SHR r7, r12
  SHLI r7, 8
  OR r10, r7

  ; Fade blue
  MOV r7, r9
  ANDI r7, 0xFF
  SHR r7, r12
  OR r10, r7           ; r10 = final faded color

  ; Skip if fully faded
  CMP r10, r26
  JZ r14, next_particle

  PSET r13, r6, r10

next_particle:
  ADD r0, r25
  CMP r0, r21
  BLT r14, update_loop

  FRAME
  JMP frame_loop

; ===== Subroutine: calc_addr =====
; Sets r11 = 0x8000 + r0 * 6
calc_addr:
  MOV r11, r0
  MUL r11, r20
  ADD r11, r23
  RET

; ===== Subroutine: randomize =====
; Randomizes particle at address r11
randomize:
  ; x = RAND & 0xFF
  RAND r13
  AND r13, r24
  STORE r11, r13
  ADD r11, r25

  ; y = RAND & 0xFF
  RAND r13
  AND r13, r24
  STORE r11, r13
  ADD r11, r25

  ; vx = (RAND & 3) + 1, randomly negated
  RAND r13
  ANDI r13, 3
  ADDI r13, 1           ; 1..4
  RAND r10
  ANDI r10, 1
  JZ r10, vx_pos
  NEG r13
vx_pos:
  STORE r11, r13
  ADD r11, r25

  ; vy = same
  RAND r13
  ANDI r13, 3
  ADDI r13, 1
  RAND r10
  ANDI r10, 1
  JZ r10, vy_pos
  NEG r13
vy_pos:
  STORE r11, r13
  ADD r11, r25

  ; color = RAND | 0x404040 (ensure bright enough)
  RAND r13
  LDI r10, 0x404040
  OR r13, r10
  STORE r11, r13
  ADD r11, r25

  ; life = 128 + (RAND & 127)
  RAND r13
  ANDI r13, 127
  ADDI r13, 128
  STORE r11, r13

  RET
