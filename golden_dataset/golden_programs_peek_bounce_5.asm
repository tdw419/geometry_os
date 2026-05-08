; DESCRIPTION: This GeOS assembly code implements a PEEK-based collision demo where a white ball bounces off various obstacles drawn on the screen. The ball's position and velocity are updated by directly reading pixel colors from the screen buffer to detect collisions with obstacles, without using an additional RAM-based collision map. The screen itself serves as the state for collision detection.

; peek_bounce.asm -- PEEK-based collision demo
;
; Demonstrates PEEK (0x4F): a white ball bounces off drawn obstacles
; by reading pixel colors from the screen buffer directly.
; No RAM-based collision map -- the screen IS the state.
;
; Registers:
;   r10  = ball x
;   r2  = ball y
;   r1  = vx (+1 or -1)
;   r12  = vy (+1 or -1)
;   r11  = ball color (white 0xFFFFFF)
;   r7  = bg color (0x001020)
;   r5, r0 = scratch

restart:
  LDI r11, 0xFFFFFF     ; ball color
  LDI r7, 0x001020     ; bg color

  ; initial ball position
  LDI r10, 128
  LDI r2, 128
  LDI r1, 1            ; vx = +1
  LDI r12, 1            ; vy = +1

  ; draw obstacles
  CALL draw_obstacles

; ── Frame loop ──────────────────────────────────────────────────────
frame_loop:
  ; clear old ball
  PSET r10, r2, r7

  ; ── X collision: peek pixel at (x+vx, y) ─────────────────────
  MOV r5, r10
  ADD r5, r1           ; r5 = x + vx
  PEEK r5, r2, r0      ; r0 = color at (x+vx, y)
  MOV r5, r0
  CMP r5, r7           ; compare with bg
  JZ r5, do_move_x     ; equal → background → safe to move
  NEG r1               ; not bg → obstacle → flip vx
  JMP check_y

do_move_x:
  ADD r10, r1           ; move x

check_y:
  ; ── Y collision: peek pixel at (x, y+vy) ─────────────────────
  MOV r5, r2
  ADD r5, r12           ; r5 = y + vy
  PEEK r10, r5, r0      ; r0 = color at (x, y+vy)
  MOV r5, r0
  CMP r5, r7
  JZ r5, do_move_y     ; bg → safe
  NEG r12               ; obstacle → flip vy
  JMP draw_ball

do_move_y:
  ADD r2, r12           ; move y

draw_ball:
  PSET r10, r2, r11
  FRAME
  JMP frame_loop

; ── draw_obstacles -- border walls + interior colored blocks ────────
draw_obstacles:
  LDI r10, 0x001020
  FILL r10

  ; border walls (blue-gray 0x4466AA)
  LDI r24, 0x4466AA

  ; top
  LDI r10, 0
  LDI r2, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r10, r2, r22, r23, r24

  ; bottom
  LDI r2, 252
  RECTF r10, r2, r22, r23, r24

  ; left
  LDI r22, 4
  LDI r23, 256
  RECTF r10, r2, r22, r23, r24

  ; right
  LDI r10, 252
  RECTF r10, r2, r22, r23, r24

  ; red block top-left
  LDI r10, 60
  LDI r2, 60
  LDI r22, 40
  LDI r23, 10
  LDI r24, 0xCC4444
  RECTF r10, r2, r22, r23, r24

  ; green pillar center
  LDI r10, 150
  LDI r2, 100
  LDI r22, 10
  LDI r23, 60
  LDI r24, 0x44CC44
  RECTF r10, r2, r22, r23, r24

  ; blue bar bottom
  LDI r10, 80
  LDI r2, 180
  LDI r22, 80
  LDI r23, 10
  LDI r24, 0x4444CC
  RECTF r10, r2, r22, r23, r24

  ; gold column right
  LDI r10, 200
  LDI r2, 30
  LDI r22, 15
  LDI r23, 50
  LDI r24, 0xCCAA44
  RECTF r10, r2, r22, r23, r24

  ; restore ball registers
  LDI r10, 128
  LDI r2, 128
  LDI r1, 1
  LDI r12, 1
  RET
