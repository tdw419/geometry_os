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
LDI r6, 0

init_loop:
  CALL calc_addr
  CALL randomize
  ADD r6, r25
  CMP r6, r21
  BLT r0, init_loop

; ===== Main frame loop =====
frame_loop:
  FILL r26            ; clear screen to black
  LDI r6, 0

update_loop:
  CALL calc_addr      ; r4 = base of particle[i]

  ; -- Load x and vx --
  LOAD r1, r4         ; r1 = x
  LDI r2, 2
  ADD r4, r2          ; r4 -> vx
  LOAD r12, r4         ; r12 = vx
  ADD r1, r12          ; x += vx

  ; Bounce X: if x >= 256, it went off screen
  CMP r1, r22
  BLT r0, x_ok
  ; Clamp x and negate vx
  LDI r1, 2
  LOAD r12, r4
  NEG r12
  STORE r4, r12        ; save negated vx
x_ok:
  ; Save x back
  CALL calc_addr
  STORE r4, r1

  ; -- Load y and vy --
  CALL calc_addr
  LDI r2, 1
  ADD r4, r2          ; r4 -> y
  LOAD r3, r4         ; r3 = y
  LDI r2, 1
  ADD r4, r2          ; r4 -> vy
  LOAD r12, r4         ; r12 = vy
  ADD r3, r12          ; y += vy

  ; Bounce Y
  CMP r3, r22
  BLT r0, y_ok
  LDI r3, 2
  LOAD r12, r4
  NEG r12
  STORE r4, r12        ; save negated vy
y_ok:
  ; Save y back
  CALL calc_addr
  LDI r2, 1
  ADD r4, r2
  STORE r4, r3

  ; -- Decrement life --
  CALL calc_addr
  LDI r2, 5
  ADD r4, r2          ; r4 -> life
  LOAD r2, r4
  SUBI r2, 1
  STORE r4, r2

  ; If life > 0, draw
  CMP r2, r26
  BGE r0, do_draw

  ; Life hit 0: respawn
  CALL calc_addr
  CALL randomize
  JMP next_particle

do_draw:
  ; -- Draw with fade --
  CALL calc_addr
  LOAD r1, r4         ; x
  LDI r2, 1
  ADD r4, r2
  LOAD r3, r4         ; y
  LDI r2, 1
  ADD r4, r2          ; skip vy
  LDI r2, 1
  ADD r4, r2          ; -> color
  LOAD r9, r4         ; r9 = color
  LDI r2, 1
  ADD r4, r2          ; -> life
  LOAD r7, r4         ; r7 = life

  ; Compute fade: shift = (255 - life) >> 5 (0..7)
  LDI r2, 255
  SUB r2, r7
  SHRI r2, 5          ; r2 = fade_shift (0..7)
  MOV r7, r2

  ; Fade red
  MOV r15, r9
  SHRI r15, 16
  SHR r15, r7
  SHLI r15, 16
  MOV r2, r15

  ; Fade green
  MOV r15, r9
  SHRI r15, 8
  ANDI r15, 0xFF
  SHR r15, r7
  SHLI r15, 8
  OR r2, r15

  ; Fade blue
  MOV r15, r9
  ANDI r15, 0xFF
  SHR r15, r7
  OR r2, r15           ; r2 = final faded color

  ; Skip if fully faded
  CMP r2, r26
  JZ r0, next_particle

  PSET r1, r3, r2

next_particle:
  ADD r6, r25
  CMP r6, r21
  BLT r0, update_loop

  FRAME
  JMP frame_loop

; ===== Subroutine: calc_addr =====
; Sets r4 = 0x8000 + r6 * 6
calc_addr:
  MOV r4, r6
  MUL r4, r20
  ADD r4, r23
  RET

; ===== Subroutine: randomize =====
; Randomizes particle at address r4
randomize:
  ; x = RAND & 0xFF
  RAND r1
  AND r1, r24
  STORE r4, r1
  ADD r4, r25

  ; y = RAND & 0xFF
  RAND r1
  AND r1, r24
  STORE r4, r1
  ADD r4, r25

  ; vx = (RAND & 3) + 1, randomly negated
  RAND r1
  ANDI r1, 3
  ADDI r1, 1           ; 1..4
  RAND r2
  ANDI r2, 1
  JZ r2, vx_pos
  NEG r1
vx_pos:
  STORE r4, r1
  ADD r4, r25

  ; vy = same
  RAND r1
  ANDI r1, 3
  ADDI r1, 1
  RAND r2
  ANDI r2, 1
  JZ r2, vy_pos
  NEG r1
vy_pos:
  STORE r4, r1
  ADD r4, r25

  ; color = RAND | 0x404040 (ensure bright enough)
  RAND r1
  LDI r2, 0x404040
  OR r1, r2
  STORE r4, r1
  ADD r4, r25

  ; life = 128 + (RAND & 127)
  RAND r1
  ANDI r1, 127
  ADDI r1, 128
  STORE r4, r1

  RET
