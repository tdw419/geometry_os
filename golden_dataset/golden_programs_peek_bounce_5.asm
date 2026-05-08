; DESCRIPTION: Render a white rectangle at the screen.

; peek_bounce.asm -- PEEK-based collision demo
;
; Demonstrates PEEK (0x4F): a white ball bounces off drawn obstacles
; by reading pixel colors from the screen buffer directly.
; No RAM-based collision map -- the screen IS the state.
;
; Registers:
;   r9  = ball x
;   r3  = ball y
;   r11  = vx (+1 or -1)
;   r6  = vy (+1 or -1)
;   r10  = ball color (white 0xFFFFFF)
;   r14  = bg color (0x001020)
;   r4, r7 = scratch

restart:
  LDI r10, 0xFFFFFF     ; ball color
  LDI r14, 0x001020     ; bg color

  ; initial ball position
  LDI r9, 128
  LDI r3, 128
  LDI r11, 1            ; vx = +1
  LDI r6, 1            ; vy = +1

  ; draw obstacles
  CALL draw_obstacles

; ── Frame loop ──────────────────────────────────────────────────────
frame_loop:
  ; clear old ball
  PSET r9, r3, r14

  ; ── X collision: peek pixel at (x+vx, y) ─────────────────────
  MOV r4, r9
  ADD r4, r11           ; r4 = x + vx
  PEEK r4, r3, r7      ; r7 = color at (x+vx, y)
  MOV r4, r7
  CMP r4, r14           ; compare with bg
  JZ r4, do_move_x     ; equal → background → safe to move
  NEG r11               ; not bg → obstacle → flip vx
  JMP check_y

do_move_x:
  ADD r9, r11           ; move x

check_y:
  ; ── Y collision: peek pixel at (x, y+vy) ─────────────────────
  MOV r4, r3
  ADD r4, r6           ; r4 = y + vy
  PEEK r9, r4, r7      ; r7 = color at (x, y+vy)
  MOV r4, r7
  CMP r4, r14
  JZ r4, do_move_y     ; bg → safe
  NEG r6               ; obstacle → flip vy
  JMP draw_ball

do_move_y:
  ADD r3, r6           ; move y

draw_ball:
  PSET r9, r3, r10
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
  LDI r3, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r9, r3, r22, r23, r24

  ; bottom
  LDI r3, 252
  RECTF r9, r3, r22, r23, r24

  ; left
  LDI r22, 4
  LDI r23, 256
  RECTF r9, r3, r22, r23, r24

  ; right
  LDI r9, 252
  RECTF r9, r3, r22, r23, r24

  ; red block top-left
  LDI r9, 60
  LDI r3, 60
  LDI r22, 40
  LDI r23, 10
  LDI r24, 0xCC4444
  RECTF r9, r3, r22, r23, r24

  ; green pillar center
  LDI r9, 150
  LDI r3, 100
  LDI r22, 10
  LDI r23, 60
  LDI r24, 0x44CC44
  RECTF r9, r3, r22, r23, r24

  ; blue bar bottom
  LDI r9, 80
  LDI r3, 180
  LDI r22, 80
  LDI r23, 10
  LDI r24, 0x4444CC
  RECTF r9, r3, r22, r23, r24

  ; gold column right
  LDI r9, 200
  LDI r3, 30
  LDI r22, 15
  LDI r23, 50
  LDI r24, 0xCCAA44
  RECTF r9, r3, r22, r23, r24

  ; restore ball registers
  LDI r9, 128
  LDI r3, 128
  LDI r11, 1
  LDI r6, 1
  RET
