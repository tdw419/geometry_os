; DESCRIPTION: Render a white rectangle at the screen.

; peek_bounce.asm -- PEEK-based collision demo
;
; Demonstrates PEEK (0x4F): a white ball bounces off drawn obstacles
; by reading pixel colors from the screen buffer directly.
; No RAM-based collision map -- the screen IS the state.
;
; Registers:
;   r9  = ball x
;   r8  = ball y
;   r4  = vx (+1 or -1)
;   r5  = vy (+1 or -1)
;   r11  = ball color (white 0xFFFFFF)
;   r14  = bg color (0x001020)
;   r10, r1 = scratch

restart:
  LDI r11, 0xFFFFFF     ; ball color
  LDI r14, 0x001020     ; bg color

  ; initial ball position
  LDI r9, 128
  LDI r8, 128
  LDI r4, 1            ; vx = +1
  LDI r5, 1            ; vy = +1

  ; draw obstacles
  CALL draw_obstacles

; ── Frame loop ──────────────────────────────────────────────────────
frame_loop:
  ; clear old ball
  PSET r9, r8, r14

  ; ── X collision: peek pixel at (x+vx, y) ─────────────────────
  MOV r10, r9
  ADD r10, r4           ; r10 = x + vx
  PEEK r10, r8, r1      ; r1 = color at (x+vx, y)
  MOV r10, r1
  CMP r10, r14           ; compare with bg
  JZ r10, do_move_x     ; equal → background → safe to move
  NEG r4               ; not bg → obstacle → flip vx
  JMP check_y

do_move_x:
  ADD r9, r4           ; move x

check_y:
  ; ── Y collision: peek pixel at (x, y+vy) ─────────────────────
  MOV r10, r8
  ADD r10, r5           ; r10 = y + vy
  PEEK r9, r10, r1      ; r1 = color at (x, y+vy)
  MOV r10, r1
  CMP r10, r14
  JZ r10, do_move_y     ; bg → safe
  NEG r5               ; obstacle → flip vy
  JMP draw_ball

do_move_y:
  ADD r8, r5           ; move y

draw_ball:
  PSET r9, r8, r11
  FRAME
  JMP frame_loop

; ── draw_obstacles -- border walls + interior colored blocks ────────
draw_obstacles:
  LDI r9, 0x001020
  FILL r9

  ; border walls (blue-gray 0x4466AA)
  LDI r24, 0x4466AA

  ; top
  LDI r9, 0
  LDI r8, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r9, r8, r22, r23, r24

  ; bottom
  LDI r8, 252
  RECTF r9, r8, r22, r23, r24

  ; left
  LDI r22, 4
  LDI r23, 256
  RECTF r9, r8, r22, r23, r24

  ; right
  LDI r9, 252
  RECTF r9, r8, r22, r23, r24

  ; red block top-left
  LDI r9, 60
  LDI r8, 60
  LDI r22, 40
  LDI r23, 10
  LDI r24, 0xCC4444
  RECTF r9, r8, r22, r23, r24

  ; green pillar center
  LDI r9, 150
  LDI r8, 100
  LDI r22, 10
  LDI r23, 60
  LDI r24, 0x44CC44
  RECTF r9, r8, r22, r23, r24

  ; blue bar bottom
  LDI r9, 80
  LDI r8, 180
  LDI r22, 80
  LDI r23, 10
  LDI r24, 0x4444CC
  RECTF r9, r8, r22, r23, r24

  ; gold column right
  LDI r9, 200
  LDI r8, 30
  LDI r22, 15
  LDI r23, 50
  LDI r24, 0xCCAA44
  RECTF r9, r8, r22, r23, r24

  ; restore ball registers
  LDI r9, 128
  LDI r8, 128
  LDI r4, 1
  LDI r5, 1
  RET
