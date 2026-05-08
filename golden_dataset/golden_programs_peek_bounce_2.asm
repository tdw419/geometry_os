; DESCRIPTION: This GeOS assembly code implements a PEEK-based collision demo where a white ball bounces off various obstacles drawn on the screen. The ball's position and velocity are updated by directly reading pixel colors from the screen buffer to detect collisions with obstacles, without using an additional RAM-based collision map. The screen itself serves as the state for collision detection.

; peek_bounce.asm -- PEEK-based collision demo
;
; Demonstrates PEEK (0x4F): a white ball bounces off drawn obstacles
; by reading pixel colors from the screen buffer directly.
; No RAM-based collision map -- the screen IS the state.
;
; Registers:
;   r3  = ball x
;   r12  = ball y
;   r11  = vx (+1 or -1)
;   r2  = vy (+1 or -1)
;   r13  = ball color (white 0xFFFFFF)
;   r15  = bg color (0x001020)
;   r4, r6 = scratch

restart:
  LDI r13, 0xFFFFFF     ; ball color
  LDI r15, 0x001020     ; bg color

  ; initial ball position
  LDI r3, 128
  LDI r12, 128
  LDI r11, 1            ; vx = +1
  LDI r2, 1            ; vy = +1

  ; draw obstacles
  CALL draw_obstacles

; ── Frame loop ──────────────────────────────────────────────────────
frame_loop:
  ; clear old ball
  PSET r3, r12, r15

  ; ── X collision: peek pixel at (x+vx, y) ─────────────────────
  MOV r4, r3
  ADD r4, r11           ; r4 = x + vx
  PEEK r4, r12, r6      ; r6 = color at (x+vx, y)
  MOV r4, r6
  CMP r4, r15           ; compare with bg
  JZ r4, do_move_x     ; equal → background → safe to move
  NEG r11               ; not bg → obstacle → flip vx
  JMP check_y

do_move_x:
  ADD r3, r11           ; move x

check_y:
  ; ── Y collision: peek pixel at (x, y+vy) ─────────────────────
  MOV r4, r12
  ADD r4, r2           ; r4 = y + vy
  PEEK r3, r4, r6      ; r6 = color at (x, y+vy)
  MOV r4, r6
  CMP r4, r15
  JZ r4, do_move_y     ; bg → safe
  NEG r2               ; obstacle → flip vy
  JMP draw_ball

do_move_y:
  ADD r12, r2           ; move y

draw_ball:
  PSET r3, r12, r13
  FRAME
  JMP frame_loop

; ── draw_obstacles -- border walls + interior colored blocks ────────
draw_obstacles:
  LDI r3, 0x001020
  FILL r3

  ; border walls (blue-gray 0x4466AA)
  LDI r24, 0x4466AA

  ; top
  LDI r3, 0
  LDI r12, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r3, r12, r22, r23, r24

  ; bottom
  LDI r12, 252
  RECTF r3, r12, r22, r23, r24

  ; left
  LDI r22, 4
  LDI r23, 256
  RECTF r3, r12, r22, r23, r24

  ; right
  LDI r3, 252
  RECTF r3, r12, r22, r23, r24

  ; red block top-left
  LDI r3, 60
  LDI r12, 60
  LDI r22, 40
  LDI r23, 10
  LDI r24, 0xCC4444
  RECTF r3, r12, r22, r23, r24

  ; green pillar center
  LDI r3, 150
  LDI r12, 100
  LDI r22, 10
  LDI r23, 60
  LDI r24, 0x44CC44
  RECTF r3, r12, r22, r23, r24

  ; blue bar bottom
  LDI r3, 80
  LDI r12, 180
  LDI r22, 80
  LDI r23, 10
  LDI r24, 0x4444CC
  RECTF r3, r12, r22, r23, r24

  ; gold column right
  LDI r3, 200
  LDI r12, 30
  LDI r22, 15
  LDI r23, 50
  LDI r24, 0xCCAA44
  RECTF r3, r12, r22, r23, r24

  ; restore ball registers
  LDI r3, 128
  LDI r12, 128
  LDI r11, 1
  LDI r2, 1
  RET
