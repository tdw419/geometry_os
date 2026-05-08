; DESCRIPTION: A white rectangle centered at the screen with fixed size.

; peek_bounce.asm -- PEEK-based collision demo
;
; Demonstrates PEEK (0x4F): a white ball bounces off drawn obstacles
; by reading pixel colors from the screen buffer directly.
; No RAM-based collision map -- the screen IS the state.
;
; Registers:
;   r15  = ball x
;   r10  = ball y
;   r9  = vx (+1 or -1)
;   r5  = vy (+1 or -1)
;   r1  = ball color (white 0xFFFFFF)
;   r11  = bg color (0x001020)
;   r8, r13 = scratch

restart:
  LDI r1, 0xFFFFFF     ; ball color
  LDI r11, 0x001020     ; bg color

  ; initial ball position
  LDI r15, 128
  LDI r10, 128
  LDI r9, 1            ; vx = +1
  LDI r5, 1            ; vy = +1

  ; draw obstacles
  CALL draw_obstacles

; ── Frame loop ──────────────────────────────────────────────────────
frame_loop:
  ; clear old ball
  PSET r15, r10, r11

  ; ── X collision: peek pixel at (x+vx, y) ─────────────────────
  MOV r8, r15
  ADD r8, r9           ; r8 = x + vx
  PEEK r8, r10, r13      ; r13 = color at (x+vx, y)
  MOV r8, r13
  CMP r8, r11           ; compare with bg
  JZ r8, do_move_x     ; equal → background → safe to move
  NEG r9               ; not bg → obstacle → flip vx
  JMP check_y

do_move_x:
  ADD r15, r9           ; move x

check_y:
  ; ── Y collision: peek pixel at (x, y+vy) ─────────────────────
  MOV r8, r10
  ADD r8, r5           ; r8 = y + vy
  PEEK r15, r8, r13      ; r13 = color at (x, y+vy)
  MOV r8, r13
  CMP r8, r11
  JZ r8, do_move_y     ; bg → safe
  NEG r5               ; obstacle → flip vy
  JMP draw_ball

do_move_y:
  ADD r10, r5           ; move y

draw_ball:
  PSET r15, r10, r1
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
  LDI r10, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r15, r10, r22, r23, r24

  ; bottom
  LDI r10, 252
  RECTF r15, r10, r22, r23, r24

  ; left
  LDI r22, 4
  LDI r23, 256
  RECTF r15, r10, r22, r23, r24

  ; right
  LDI r15, 252
  RECTF r15, r10, r22, r23, r24

  ; red block top-left
  LDI r15, 60
  LDI r10, 60
  LDI r22, 40
  LDI r23, 10
  LDI r24, 0xCC4444
  RECTF r15, r10, r22, r23, r24

  ; green pillar center
  LDI r15, 150
  LDI r10, 100
  LDI r22, 10
  LDI r23, 60
  LDI r24, 0x44CC44
  RECTF r15, r10, r22, r23, r24

  ; blue bar bottom
  LDI r15, 80
  LDI r10, 180
  LDI r22, 80
  LDI r23, 10
  LDI r24, 0x4444CC
  RECTF r15, r10, r22, r23, r24

  ; gold column right
  LDI r15, 200
  LDI r10, 30
  LDI r22, 15
  LDI r23, 50
  LDI r24, 0xCCAA44
  RECTF r15, r10, r22, r23, r24

  ; restore ball registers
  LDI r15, 128
  LDI r10, 128
  LDI r9, 1
  LDI r5, 1
  RET
