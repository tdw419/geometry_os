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
LDI r2, 0

init_loop:
  CALL calc_addr
  CALL randomize
  ADD r2, r25
  CMP r2, r21
  BLT r6, init_loop

; ===== Main frame loop =====
frame_loop:
  FILL r26            ; clear screen to black
  LDI r2, 0

update_loop:
  CALL calc_addr      ; r9 = base of particle[i]

  ; -- Load x and vx --
  LOAD r12, r9         ; r12 = x
  LDI r3, 2
  ADD r9, r3          ; r9 -> vx
  LOAD r8, r9         ; r8 = vx
  ADD r12, r8          ; x += vx

  ; Bounce X: if x >= 256, it went off screen
  CMP r12, r22
  BLT r6, x_ok
  ; Clamp x and negate vx
  LDI r12, 2
  LOAD r8, r9
  NEG r8
  STORE r9, r8        ; save negated vx
x_ok:
  ; Save x back
  CALL calc_addr
  STORE r9, r12

  ; -- Load y and vy --
  CALL calc_addr
  LDI r3, 1
  ADD r9, r3          ; r9 -> y
  LOAD r0, r9         ; r0 = y
  LDI r3, 1
  ADD r9, r3          ; r9 -> vy
  LOAD r8, r9         ; r8 = vy
  ADD r0, r8          ; y += vy

  ; Bounce Y
  CMP r0, r22
  BLT r6, y_ok
  LDI r0, 2
  LOAD r8, r9
  NEG r8
  STORE r9, r8        ; save negated vy
y_ok:
  ; Save y back
  CALL calc_addr
  LDI r3, 1
  ADD r9, r3
  STORE r9, r0

  ; -- Decrement life --
  CALL calc_addr
  LDI r3, 5
  ADD r9, r3          ; r9 -> life
  LOAD r3, r9
  SUBI r3, 1
  STORE r9, r3

  ; If life > 0, draw
  CMP r3, r26
  BGE r6, do_draw

  ; Life hit 0: respawn
  CALL calc_addr
  CALL randomize
  JMP next_particle

do_draw:
  ; -- Draw with fade --
  CALL calc_addr
  LOAD r12, r9         ; x
  LDI r3, 1
  ADD r9, r3
  LOAD r0, r9         ; y
  LDI r3, 1
  ADD r9, r3          ; skip vy
  LDI r3, 1
  ADD r9, r3          ; -> color
  LOAD r15, r9         ; r15 = color
  LDI r3, 1
  ADD r9, r3          ; -> life
  LOAD r1, r9         ; r1 = life

  ; Compute fade: shift = (255 - life) >> 5 (0..7)
  LDI r3, 255
  SUB r3, r1
  SHRI r3, 5          ; r3 = fade_shift (0..7)
  MOV r1, r3

  ; Fade red
  MOV r13, r15
  SHRI r13, 16
  SHR r13, r1
  SHLI r13, 16
  MOV r3, r13

  ; Fade green
  MOV r13, r15
  SHRI r13, 8
  ANDI r13, 0xFF
  SHR r13, r1
  SHLI r13, 8
  OR r3, r13

  ; Fade blue
  MOV r13, r15
  ANDI r13, 0xFF
  SHR r13, r1
  OR r3, r13           ; r3 = final faded color

  ; Skip if fully faded
  CMP r3, r26
  JZ r6, next_particle

  PSET r12, r0, r3

next_particle:
  ADD r2, r25
  CMP r2, r21
  BLT r6, update_loop

  FRAME
  JMP frame_loop

; ===== Subroutine: calc_addr =====
; Sets r9 = 0x8000 + r2 * 6
calc_addr:
  MOV r9, r2
  MUL r9, r20
  ADD r9, r23
  RET

; ===== Subroutine: randomize =====
; Randomizes particle at address r9
randomize:
  ; x = RAND & 0xFF
  RAND r12
  AND r12, r24
  STORE r9, r12
  ADD r9, r25

  ; y = RAND & 0xFF
  RAND r12
  AND r12, r24
  STORE r9, r12
  ADD r9, r25

  ; vx = (RAND & 3) + 1, randomly negated
  RAND r12
  ANDI r12, 3
  ADDI r12, 1           ; 1..4
  RAND r3
  ANDI r3, 1
  JZ r3, vx_pos
  NEG r12
vx_pos:
  STORE r9, r12
  ADD r9, r25

  ; vy = same
  RAND r12
  ANDI r12, 3
  ADDI r12, 1
  RAND r3
  ANDI r3, 1
  JZ r3, vy_pos
  NEG r12
vy_pos:
  STORE r9, r12
  ADD r9, r25

  ; color = RAND | 0x404040 (ensure bright enough)
  RAND r12
  LDI r3, 0x404040
  OR r12, r3
  STORE r9, r12
  ADD r9, r25

  ; life = 128 + (RAND & 127)
  RAND r12
  ANDI r12, 127
  ADDI r12, 128
  STORE r9, r12

  RET
