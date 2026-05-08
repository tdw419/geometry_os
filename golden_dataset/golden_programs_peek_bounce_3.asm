; DESCRIPTION: Geometry OS program to draw a white rectangle.

; peek_bounce.asm -- PEEK-based collision demo
;
; Demonstrates PEEK (0x4F): a white ball bounces off drawn obstacles
; by reading pixel colors from the screen buffer directly.
; No RAM-based collision map -- the screen IS the state.
;
; Registers:
;   r3  = ball x
;   r15  = ball y
;   r10  = vx (+1 or -1)
;   r14  = vy (+1 or -1)
;   r2  = ball color (white 0xFFFFFF)
;   r13  = bg color (0x001020)
;   r9, r12 = scratch

restart:
  LDI r2, 0xFFFFFF     ; ball color
  LDI r13, 0x001020     ; bg color

  ; initial ball position
  LDI r3, 128
  LDI r15, 128
  LDI r10, 1            ; vx = +1
  LDI r14, 1            ; vy = +1

  ; draw obstacles
  CALL draw_obstacles

; ── Frame loop ──────────────────────────────────────────────────────
frame_loop:
  ; clear old ball
  PSET r3, r15, r13

  ; ── X collision: peek pixel at (x+vx, y) ─────────────────────
  MOV r9, r3
  ADD r9, r10           ; r9 = x + vx
  PEEK r9, r15, r12      ; r12 = color at (x+vx, y)
  MOV r9, r12
  CMP r9, r13           ; compare with bg
  JZ r9, do_move_x     ; equal → background → safe to move
  NEG r10               ; not bg → obstacle → flip vx
  JMP check_y

do_move_x:
  ADD r3, r10           ; move x

check_y:
  ; ── Y collision: peek pixel at (x, y+vy) ─────────────────────
  MOV r9, r15
  ADD r9, r14           ; r9 = y + vy
  PEEK r3, r9, r12      ; r12 = color at (x, y+vy)
  MOV r9, r12
  CMP r9, r13
  JZ r9, do_move_y     ; bg → safe
  NEG r14               ; obstacle → flip vy
  JMP draw_ball

do_move_y:
  ADD r15, r14           ; move y

draw_ball:
  PSET r3, r15, r2
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
  LDI r15, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r3, r15, r22, r23, r24

  ; bottom
  LDI r15, 252
  RECTF r3, r15, r22, r23, r24

  ; left
  LDI r22, 4
  LDI r23, 256
  RECTF r3, r15, r22, r23, r24

  ; right
  LDI r3, 252
  RECTF r3, r15, r22, r23, r24

  ; red block top-left
  LDI r3, 60
  LDI r15, 60
  LDI r22, 40
  LDI r23, 10
  LDI r24, 0xCC4444
  RECTF r3, r15, r22, r23, r24

  ; green pillar center
  LDI r3, 150
  LDI r15, 100
  LDI r22, 10
  LDI r23, 60
  LDI r24, 0x44CC44
  RECTF r3, r15, r22, r23, r24

  ; blue bar bottom
  LDI r3, 80
  LDI r15, 180
  LDI r22, 80
  LDI r23, 10
  LDI r24, 0x4444CC
  RECTF r3, r15, r22, r23, r24

  ; gold column right
  LDI r3, 200
  LDI r15, 30
  LDI r22, 15
  LDI r23, 50
  LDI r24, 0xCCAA44
  RECTF r3, r15, r22, r23, r24

  ; restore ball registers
  LDI r3, 128
  LDI r15, 128
  LDI r10, 1
  LDI r14, 1
  RET
