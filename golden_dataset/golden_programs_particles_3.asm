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
LDI r15, 0

init_loop:
  CALL calc_addr
  CALL randomize
  ADD r15, r25
  CMP r15, r21
  BLT r9, init_loop

; ===== Main frame loop =====
frame_loop:
  FILL r26            ; clear screen to black
  LDI r15, 0

update_loop:
  CALL calc_addr      ; r8 = base of particle[i]

  ; -- Load x and vx --
  LOAD r0, r8         ; r0 = x
  LDI r5, 2
  ADD r8, r5          ; r8 -> vx
  LOAD r4, r8         ; r4 = vx
  ADD r0, r4          ; x += vx

  ; Bounce X: if x >= 256, it went off screen
  CMP r0, r22
  BLT r9, x_ok
  ; Clamp x and negate vx
  LDI r0, 2
  LOAD r4, r8
  NEG r4
  STORE r8, r4        ; save negated vx
x_ok:
  ; Save x back
  CALL calc_addr
  STORE r8, r0

  ; -- Load y and vy --
  CALL calc_addr
  LDI r5, 1
  ADD r8, r5          ; r8 -> y
  LOAD r6, r8         ; r6 = y
  LDI r5, 1
  ADD r8, r5          ; r8 -> vy
  LOAD r4, r8         ; r4 = vy
  ADD r6, r4          ; y += vy

  ; Bounce Y
  CMP r6, r22
  BLT r9, y_ok
  LDI r6, 2
  LOAD r4, r8
  NEG r4
  STORE r8, r4        ; save negated vy
y_ok:
  ; Save y back
  CALL calc_addr
  LDI r5, 1
  ADD r8, r5
  STORE r8, r6

  ; -- Decrement life --
  CALL calc_addr
  LDI r5, 5
  ADD r8, r5          ; r8 -> life
  LOAD r5, r8
  SUBI r5, 1
  STORE r8, r5

  ; If life > 0, draw
  CMP r5, r26
  BGE r9, do_draw

  ; Life hit 0: respawn
  CALL calc_addr
  CALL randomize
  JMP next_particle

do_draw:
  ; -- Draw with fade --
  CALL calc_addr
  LOAD r0, r8         ; x
  LDI r5, 1
  ADD r8, r5
  LOAD r6, r8         ; y
  LDI r5, 1
  ADD r8, r5          ; skip vy
  LDI r5, 1
  ADD r8, r5          ; -> color
  LOAD r11, r8         ; r11 = color
  LDI r5, 1
  ADD r8, r5          ; -> life
  LOAD r1, r8         ; r1 = life

  ; Compute fade: shift = (255 - life) >> 5 (0..7)
  LDI r5, 255
  SUB r5, r1
  SHRI r5, 5          ; r5 = fade_shift (0..7)
  MOV r1, r5

  ; Fade red
  MOV r7, r11
  SHRI r7, 16
  SHR r7, r1
  SHLI r7, 16
  MOV r5, r7

  ; Fade green
  MOV r7, r11
  SHRI r7, 8
  ANDI r7, 0xFF
  SHR r7, r1
  SHLI r7, 8
  OR r5, r7

  ; Fade blue
  MOV r7, r11
  ANDI r7, 0xFF
  SHR r7, r1
  OR r5, r7           ; r5 = final faded color

  ; Skip if fully faded
  CMP r5, r26
  JZ r9, next_particle

  PSET r0, r6, r5

next_particle:
  ADD r15, r25
  CMP r15, r21
  BLT r9, update_loop

  FRAME
  JMP frame_loop

; ===== Subroutine: calc_addr =====
; Sets r8 = 0x8000 + r15 * 6
calc_addr:
  MOV r8, r15
  MUL r8, r20
  ADD r8, r23
  RET

; ===== Subroutine: randomize =====
; Randomizes particle at address r8
randomize:
  ; x = RAND & 0xFF
  RAND r0
  AND r0, r24
  STORE r8, r0
  ADD r8, r25

  ; y = RAND & 0xFF
  RAND r0
  AND r0, r24
  STORE r8, r0
  ADD r8, r25

  ; vx = (RAND & 3) + 1, randomly negated
  RAND r0
  ANDI r0, 3
  ADDI r0, 1           ; 1..4
  RAND r5
  ANDI r5, 1
  JZ r5, vx_pos
  NEG r0
vx_pos:
  STORE r8, r0
  ADD r8, r25

  ; vy = same
  RAND r0
  ANDI r0, 3
  ADDI r0, 1
  RAND r5
  ANDI r5, 1
  JZ r5, vy_pos
  NEG r0
vy_pos:
  STORE r8, r0
  ADD r8, r25

  ; color = RAND | 0x404040 (ensure bright enough)
  RAND r0
  LDI r5, 0x404040
  OR r0, r5
  STORE r8, r0
  ADD r8, r25

  ; life = 128 + (RAND & 127)
  RAND r0
  ANDI r0, 127
  ADDI r0, 128
  STORE r8, r0

  RET
