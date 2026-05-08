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
LDI r5, 0

init_loop:
  CALL calc_addr
  CALL randomize
  ADD r5, r25
  CMP r5, r21
  BLT r2, init_loop

; ===== Main frame loop =====
frame_loop:
  FILL r26            ; clear screen to black
  LDI r5, 0

update_loop:
  CALL calc_addr      ; r6 = base of particle[i]

  ; -- Load x and vx --
  LOAD r8, r6         ; r8 = x
  LDI r12, 2
  ADD r6, r12          ; r6 -> vx
  LOAD r11, r6         ; r11 = vx
  ADD r8, r11          ; x += vx

  ; Bounce X: if x >= 256, it went off screen
  CMP r8, r22
  BLT r2, x_ok
  ; Clamp x and negate vx
  LDI r8, 2
  LOAD r11, r6
  NEG r11
  STORE r6, r11        ; save negated vx
x_ok:
  ; Save x back
  CALL calc_addr
  STORE r6, r8

  ; -- Load y and vy --
  CALL calc_addr
  LDI r12, 1
  ADD r6, r12          ; r6 -> y
  LOAD r10, r6         ; r10 = y
  LDI r12, 1
  ADD r6, r12          ; r6 -> vy
  LOAD r11, r6         ; r11 = vy
  ADD r10, r11          ; y += vy

  ; Bounce Y
  CMP r10, r22
  BLT r2, y_ok
  LDI r10, 2
  LOAD r11, r6
  NEG r11
  STORE r6, r11        ; save negated vy
y_ok:
  ; Save y back
  CALL calc_addr
  LDI r12, 1
  ADD r6, r12
  STORE r6, r10

  ; -- Decrement life --
  CALL calc_addr
  LDI r12, 5
  ADD r6, r12          ; r6 -> life
  LOAD r12, r6
  SUBI r12, 1
  STORE r6, r12

  ; If life > 0, draw
  CMP r12, r26
  BGE r2, do_draw

  ; Life hit 0: respawn
  CALL calc_addr
  CALL randomize
  JMP next_particle

do_draw:
  ; -- Draw with fade --
  CALL calc_addr
  LOAD r8, r6         ; x
  LDI r12, 1
  ADD r6, r12
  LOAD r10, r6         ; y
  LDI r12, 1
  ADD r6, r12          ; skip vy
  LDI r12, 1
  ADD r6, r12          ; -> color
  LOAD r0, r6         ; r0 = color
  LDI r12, 1
  ADD r6, r12          ; -> life
  LOAD r9, r6         ; r9 = life

  ; Compute fade: shift = (255 - life) >> 5 (0..7)
  LDI r12, 255
  SUB r12, r9
  SHRI r12, 5          ; r12 = fade_shift (0..7)
  MOV r9, r12

  ; Fade red
  MOV r7, r0
  SHRI r7, 16
  SHR r7, r9
  SHLI r7, 16
  MOV r12, r7

  ; Fade green
  MOV r7, r0
  SHRI r7, 8
  ANDI r7, 0xFF
  SHR r7, r9
  SHLI r7, 8
  OR r12, r7

  ; Fade blue
  MOV r7, r0
  ANDI r7, 0xFF
  SHR r7, r9
  OR r12, r7           ; r12 = final faded color

  ; Skip if fully faded
  CMP r12, r26
  JZ r2, next_particle

  PSET r8, r10, r12

next_particle:
  ADD r5, r25
  CMP r5, r21
  BLT r2, update_loop

  FRAME
  JMP frame_loop

; ===== Subroutine: calc_addr =====
; Sets r6 = 0x8000 + r5 * 6
calc_addr:
  MOV r6, r5
  MUL r6, r20
  ADD r6, r23
  RET

; ===== Subroutine: randomize =====
; Randomizes particle at address r6
randomize:
  ; x = RAND & 0xFF
  RAND r8
  AND r8, r24
  STORE r6, r8
  ADD r6, r25

  ; y = RAND & 0xFF
  RAND r8
  AND r8, r24
  STORE r6, r8
  ADD r6, r25

  ; vx = (RAND & 3) + 1, randomly negated
  RAND r8
  ANDI r8, 3
  ADDI r8, 1           ; 1..4
  RAND r12
  ANDI r12, 1
  JZ r12, vx_pos
  NEG r8
vx_pos:
  STORE r6, r8
  ADD r6, r25

  ; vy = same
  RAND r8
  ANDI r8, 3
  ADDI r8, 1
  RAND r12
  ANDI r12, 1
  JZ r12, vy_pos
  NEG r8
vy_pos:
  STORE r6, r8
  ADD r6, r25

  ; color = RAND | 0x404040 (ensure bright enough)
  RAND r8
  LDI r12, 0x404040
  OR r8, r12
  STORE r6, r8
  ADD r6, r25

  ; life = 128 + (RAND & 127)
  RAND r8
  ANDI r8, 127
  ADDI r8, 128
  STORE r6, r8

  RET
