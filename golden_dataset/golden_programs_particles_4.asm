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
LDI r13, 0

init_loop:
  CALL calc_addr
  CALL randomize
  ADD r13, r25
  CMP r13, r21
  BLT r3, init_loop

; ===== Main frame loop =====
frame_loop:
  FILL r26            ; clear screen to black
  LDI r13, 0

update_loop:
  CALL calc_addr      ; r12 = base of particle[i]

  ; -- Load x and vx --
  LOAD r2, r12         ; r2 = x
  LDI r6, 2
  ADD r12, r6          ; r12 -> vx
  LOAD r11, r12         ; r11 = vx
  ADD r2, r11          ; x += vx

  ; Bounce X: if x >= 256, it went off screen
  CMP r2, r22
  BLT r3, x_ok
  ; Clamp x and negate vx
  LDI r2, 2
  LOAD r11, r12
  NEG r11
  STORE r12, r11        ; save negated vx
x_ok:
  ; Save x back
  CALL calc_addr
  STORE r12, r2

  ; -- Load y and vy --
  CALL calc_addr
  LDI r6, 1
  ADD r12, r6          ; r12 -> y
  LOAD r5, r12         ; r5 = y
  LDI r6, 1
  ADD r12, r6          ; r12 -> vy
  LOAD r11, r12         ; r11 = vy
  ADD r5, r11          ; y += vy

  ; Bounce Y
  CMP r5, r22
  BLT r3, y_ok
  LDI r5, 2
  LOAD r11, r12
  NEG r11
  STORE r12, r11        ; save negated vy
y_ok:
  ; Save y back
  CALL calc_addr
  LDI r6, 1
  ADD r12, r6
  STORE r12, r5

  ; -- Decrement life --
  CALL calc_addr
  LDI r6, 5
  ADD r12, r6          ; r12 -> life
  LOAD r6, r12
  SUBI r6, 1
  STORE r12, r6

  ; If life > 0, draw
  CMP r6, r26
  BGE r3, do_draw

  ; Life hit 0: respawn
  CALL calc_addr
  CALL randomize
  JMP next_particle

do_draw:
  ; -- Draw with fade --
  CALL calc_addr
  LOAD r2, r12         ; x
  LDI r6, 1
  ADD r12, r6
  LOAD r5, r12         ; y
  LDI r6, 1
  ADD r12, r6          ; skip vy
  LDI r6, 1
  ADD r12, r6          ; -> color
  LOAD r10, r12         ; r10 = color
  LDI r6, 1
  ADD r12, r6          ; -> life
  LOAD r0, r12         ; r0 = life

  ; Compute fade: shift = (255 - life) >> 5 (0..7)
  LDI r6, 255
  SUB r6, r0
  SHRI r6, 5          ; r6 = fade_shift (0..7)
  MOV r0, r6

  ; Fade red
  MOV r7, r10
  SHRI r7, 16
  SHR r7, r0
  SHLI r7, 16
  MOV r6, r7

  ; Fade green
  MOV r7, r10
  SHRI r7, 8
  ANDI r7, 0xFF
  SHR r7, r0
  SHLI r7, 8
  OR r6, r7

  ; Fade blue
  MOV r7, r10
  ANDI r7, 0xFF
  SHR r7, r0
  OR r6, r7           ; r6 = final faded color

  ; Skip if fully faded
  CMP r6, r26
  JZ r3, next_particle

  PSET r2, r5, r6

next_particle:
  ADD r13, r25
  CMP r13, r21
  BLT r3, update_loop

  FRAME
  JMP frame_loop

; ===== Subroutine: calc_addr =====
; Sets r12 = 0x8000 + r13 * 6
calc_addr:
  MOV r12, r13
  MUL r12, r20
  ADD r12, r23
  RET

; ===== Subroutine: randomize =====
; Randomizes particle at address r12
randomize:
  ; x = RAND & 0xFF
  RAND r2
  AND r2, r24
  STORE r12, r2
  ADD r12, r25

  ; y = RAND & 0xFF
  RAND r2
  AND r2, r24
  STORE r12, r2
  ADD r12, r25

  ; vx = (RAND & 3) + 1, randomly negated
  RAND r2
  ANDI r2, 3
  ADDI r2, 1           ; 1..4
  RAND r6
  ANDI r6, 1
  JZ r6, vx_pos
  NEG r2
vx_pos:
  STORE r12, r2
  ADD r12, r25

  ; vy = same
  RAND r2
  ANDI r2, 3
  ADDI r2, 1
  RAND r6
  ANDI r6, 1
  JZ r6, vy_pos
  NEG r2
vy_pos:
  STORE r12, r2
  ADD r12, r25

  ; color = RAND | 0x404040 (ensure bright enough)
  RAND r2
  LDI r6, 0x404040
  OR r2, r6
  STORE r12, r2
  ADD r12, r25

  ; life = 128 + (RAND & 127)
  RAND r2
  ANDI r2, 127
  ADDI r2, 128
  STORE r12, r2

  RET
