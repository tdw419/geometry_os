; DESCRIPTION: Render a white rectangle at the screen.

; peek_bounce.asm -- PEEK-based collision demo
;
; Demonstrates PEEK (0x4F): a white ball bounces off drawn obstacles
; by reading pixel colors from the screen buffer directly.
; No RAM-based collision map -- the screen IS the state.
;
; Registers:
;   r13  = ball x
;   r12  = ball y
;   r10  = vx (+1 or -1)
;   r2  = vy (+1 or -1)
;   r4  = ball color (white 0xFFFFFF)
;   r14  = bg color (0x001020)
;   r5, r6 = scratch

restart:
  LDI r4, 0xFFFFFF     ; ball color
  LDI r14, 0x001020     ; bg color

  ; initial ball position
  LDI r13, 128
  LDI r12, 128
  LDI r10, 1            ; vx = +1
  LDI r2, 1            ; vy = +1

  ; draw obstacles
  CALL draw_obstacles

; ── Frame loop ──────────────────────────────────────────────────────
frame_loop:
  ; clear old ball
  PSET r13, r12, r14

  ; ── X collision: peek pixel at (x+vx, y) ─────────────────────
  MOV r5, r13
  ADD r5, r10           ; r5 = x + vx
  PEEK r5, r12, r6      ; r6 = color at (x+vx, y)
  MOV r5, r6
  CMP r5, r14           ; compare with bg
  JZ r5, do_move_x     ; equal → background → safe to move
  NEG r10               ; not bg → obstacle → flip vx
  JMP check_y

do_move_x:
  ADD r13, r10           ; move x

check_y:
  ; ── Y collision: peek pixel at (x, y+vy) ─────────────────────
  MOV r5, r12
  ADD r5, r2           ; r5 = y + vy
  PEEK r13, r5, r6      ; r6 = color at (x, y+vy)
  MOV r5, r6
  CMP r5, r14
  JZ r5, do_move_y     ; bg → safe
  NEG r2               ; obstacle → flip vy
  JMP draw_ball

do_move_y:
  ADD r12, r2           ; move y

draw_ball:
  PSET r13, r12, r4
  FRAME
  JMP frame_loop

; ── draw_obstacles -- border walls + interior colored blocks ────────
draw_obstacles:
  LDI r13, 0x001020
  FILL r13

  ; border walls (blue-gray 0x4466AA)
  LDI r24, 0x4466AA

  ; top
  LDI r13, 0
  LDI r12, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r13, r12, r22, r23, r24

  ; bottom
  LDI r12, 252
  RECTF r13, r12, r22, r23, r24

  ; left
  LDI r22, 4
  LDI r23, 256
  RECTF r13, r12, r22, r23, r24

  ; right
  LDI r13, 252
  RECTF r13, r12, r22, r23, r24

  ; red block top-left
  LDI r13, 60
  LDI r12, 60
  LDI r22, 40
  LDI r23, 10
  LDI r24, 0xCC4444
  RECTF r13, r12, r22, r23, r24

  ; green pillar center
  LDI r13, 150
  LDI r12, 100
  LDI r22, 10
  LDI r23, 60
  LDI r24, 0x44CC44
  RECTF r13, r12, r22, r23, r24

  ; blue bar bottom
  LDI r13, 80
  LDI r12, 180
  LDI r22, 80
  LDI r23, 10
  LDI r24, 0x4444CC
  RECTF r13, r12, r22, r23, r24

  ; gold column right
  LDI r13, 200
  LDI r12, 30
  LDI r22, 15
  LDI r23, 50
  LDI r24, 0xCCAA44
  RECTF r13, r12, r22, r23, r24

  ; restore ball registers
  LDI r13, 128
  LDI r12, 128
  LDI r10, 1
  LDI r2, 1
  RET
