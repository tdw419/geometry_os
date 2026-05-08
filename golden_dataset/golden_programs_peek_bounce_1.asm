; DESCRIPTION: This GeOS assembly code implements a PEEK-based collision demo where a white ball bounces off various obstacles drawn on the screen. The ball's position and velocity are updated by directly reading pixel colors from the screen buffer to detect collisions with obstacles, without using an additional RAM-based collision map. The screen itself serves as the state for collision detection.

; peek_bounce.asm -- PEEK-based collision demo
;
; Demonstrates PEEK (0x4F): a white ball bounces off drawn obstacles
; by reading pixel colors from the screen buffer directly.
; No RAM-based collision map -- the screen IS the state.
;
; Registers:
;   r15  = ball x
;   r12  = ball y
;   r10  = vx (+1 or -1)
;   r9  = vy (+1 or -1)
;   r2  = ball color (white 0xFFFFFF)
;   r3  = bg color (0x001020)
;   r7, r4 = scratch

restart:
  LDI r2, 0xFFFFFF     ; ball color
  LDI r3, 0x001020     ; bg color

  ; initial ball position
  LDI r15, 128
  LDI r12, 128
  LDI r10, 1            ; vx = +1
  LDI r9, 1            ; vy = +1

  ; draw obstacles
  CALL draw_obstacles

; ── Frame loop ──────────────────────────────────────────────────────
frame_loop:
  ; clear old ball
  PSET r15, r12, r3

  ; ── X collision: peek pixel at (x+vx, y) ─────────────────────
  MOV r7, r15
  ADD r7, r10           ; r7 = x + vx
  PEEK r7, r12, r4      ; r4 = color at (x+vx, y)
  MOV r7, r4
  CMP r7, r3           ; compare with bg
  JZ r7, do_move_x     ; equal → background → safe to move
  NEG r10               ; not bg → obstacle → flip vx
  JMP check_y

do_move_x:
  ADD r15, r10           ; move x

check_y:
  ; ── Y collision: peek pixel at (x, y+vy) ─────────────────────
  MOV r7, r12
  ADD r7, r9           ; r7 = y + vy
  PEEK r15, r7, r4      ; r4 = color at (x, y+vy)
  MOV r7, r4
  CMP r7, r3
  JZ r7, do_move_y     ; bg → safe
  NEG r9               ; obstacle → flip vy
  JMP draw_ball

do_move_y:
  ADD r12, r9           ; move y

draw_ball:
  PSET r15, r12, r2
  FRAME
  JMP frame_loop

; ── draw_obstacles -- border walls + interior colored blocks ────────
draw_obstacles:
  LDI r15, 0x001020
  FILL r15

  ; border walls (blue-gray 0x4466AA)
  LDI r24, 0x4466AA

  ; top
  LDI r15, 0
  LDI r12, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r15, r12, r22, r23, r24

  ; bottom
  LDI r12, 252
  RECTF r15, r12, r22, r23, r24

  ; left
  LDI r22, 4
  LDI r23, 256
  RECTF r15, r12, r22, r23, r24

  ; right
  LDI r15, 252
  RECTF r15, r12, r22, r23, r24

  ; red block top-left
  LDI r15, 60
  LDI r12, 60
  LDI r22, 40
  LDI r23, 10
  LDI r24, 0xCC4444
  RECTF r15, r12, r22, r23, r24

  ; green pillar center
  LDI r15, 150
  LDI r12, 100
  LDI r22, 10
  LDI r23, 60
  LDI r24, 0x44CC44
  RECTF r15, r12, r22, r23, r24

  ; blue bar bottom
  LDI r15, 80
  LDI r12, 180
  LDI r22, 80
  LDI r23, 10
  LDI r24, 0x4444CC
  RECTF r15, r12, r22, r23, r24

  ; gold column right
  LDI r15, 200
  LDI r12, 30
  LDI r22, 15
  LDI r23, 50
  LDI r24, 0xCCAA44
  RECTF r15, r12, r22, r23, r24

  ; restore ball registers
  LDI r15, 128
  LDI r12, 128
  LDI r10, 1
  LDI r9, 1
  RET
