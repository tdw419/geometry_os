; DESCRIPTION: Render a red object at the screen.

; breakout.asm -- Breakout / Brick Breaker for Geometry OS
;
; Controls:
;   A/D or Left/Right arrows -- move paddle
;   W or Space -- launch ball
;   R -- restart game
;
; Layout (256x256 screen):
;   y=0..7:   score area (text)
;   y=8..39:  bricks (8 cols x 4 rows, 32x8 px each)
;   y=40..243: play field
;   y=244..249: paddle (48x6 px)
;
; Memory map:
;   0x3000..0x301F  brick[0..31]  (0=dead, color=alive)
;   0x3020          paddle_x      (0..208)
;   0x3021          ball_x
;   0x3022          ball_y
;   0x3023          ball_dx       (signed u32)
;   0x3024          ball_dy       (signed u32)
;   0x3025          score
;   0x3026          lives         (3)
;   0x3027          game_over     (0=play, 1=win, 2=lose)
;   0x3028          ball_launched (0=on paddle, 1=flying)
;   0x3029          bricks_left
;   0x3100..0x3106  score text buf (7 chars + null)

; ── init / restart ──────────────────────────────────────────────
restart:
  LDI r30, 0x8000

  ; write "SCORE:" text to buffer (stays constant)
  LDI r4, 0x3100
  LDI r9, 83
  STORE r4, r9        ; S
  LDI r4, 0x3101
  LDI r9, 67
  STORE r4, r9        ; C
  LDI r4, 0x3102
  LDI r9, 79
  STORE r4, r9        ; O
  LDI r4, 0x3103
  LDI r9, 82
  STORE r4, r9        ; R
  LDI r4, 0x3104
  LDI r9, 69
  STORE r4, r9        ; E
  LDI r4, 0x3105
  LDI r9, 58
  STORE r4, r9        ; :

  ; init bricks -- row 0=red, row 1=orange, row 2=yellow, row 3=green
  LDI r22, 0xFF0000   ; red
  LDI r23, 0xFF8800   ; orange
  LDI r24, 0xFFDD00   ; yellow
  LDI r25, 0x00CC44   ; green
  LDI r3, 0          ; brick index

ib_loop:
  LDI r7, 0
  ADD r7, r3
  LDI r10, 3
  SHR r7, r10          ; r7 = row (0-3)
  ; default green (row 3)
  LDI r9, 0
  ADD r9, r25
  ; check row 0
  LDI r10, 0
  CMP r7, r10
  JZ r13, ib_r0
  ; check row 1
  LDI r10, 1
  CMP r7, r10
  JZ r13, ib_r1
  ; check row 2
  LDI r10, 2
  CMP r7, r10
  JZ r13, ib_r2
  JMP ib_store        ; row 3 = green (already in r9)

ib_r0:
  LDI r9, 0
  ADD r9, r22         ; red
  JMP ib_store

ib_r1:
  LDI r9, 0
  ADD r9, r23         ; orange
  JMP ib_store

ib_r2:
  LDI r9, 0
  ADD r9, r24         ; yellow

ib_store:
  LDI r4, 0x3000
  ADD r4, r3
  STORE r4, r9
  LDI r7, 1
  ADD r3, r7
  LDI r10, 32
  CMP r3, r10
  BLT r13, ib_loop

  ; init game state
  LDI r9, 104
  LDI r4, 0x3020
  STORE r4, r9        ; paddle_x = 104 (centered)
  LDI r9, 0
  LDI r4, 0x3025
  STORE r4, r9        ; score = 0
  LDI r9, 3
  LDI r4, 0x3026
  STORE r4, r9        ; lives = 3
  LDI r9, 0
  LDI r4, 0x3027
  STORE r4, r9        ; game_over = 0
  LDI r9, 32
  LDI r4, 0x3029
  STORE r4, r9        ; bricks_left = 32

  CALL reset_ball

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r4, 0x3027
  LOAD r9, r4
  JNZ r9, game_over_screen

  ; read keyboard
  IKEY r8

  ; A/a = paddle left
  LDI r10, 65
  CMP r8, r10
  JZ r13, pad_left
  LDI r10, 97
  CMP r8, r10
  JZ r13, pad_left

  ; D/d = paddle right
  LDI r10, 68
  CMP r8, r10
  JZ r13, pad_right
  LDI r10, 100
  CMP r8, r10
  JZ r13, pad_right

  ; W/w/Space = launch ball
  LDI r10, 87
  CMP r8, r10
  JZ r13, do_launch
  LDI r10, 119
  CMP r8, r10
  JZ r13, do_launch
  LDI r10, 32
  CMP r8, r10
  JZ r13, do_launch

  ; R/r = restart
  LDI r10, 82
  CMP r8, r10
  JZ r13, restart
  LDI r10, 114
  CMP r8, r10
  JZ r13, restart

after_input:
  ; if ball not launched, stick to paddle
  LDI r4, 0x3028
  LOAD r9, r4
  JNZ r9, update_ball

  ; ball sits on paddle
  LDI r4, 0x3020
  LOAD r9, r4          ; paddle_x
  LDI r7, 22
  ADD r9, r7           ; center ball on paddle
  LDI r4, 0x3021
  STORE r4, r9         ; ball_x
  LDI r9, 240
  LDI r4, 0x3022
  STORE r4, r9         ; ball_y = 240
  JMP draw_and_loop

update_ball:
  ; move ball x
  LDI r4, 0x3021
  LOAD r9, r4
  LDI r4, 0x3023
  LOAD r5, r4
  ADD r9, r5
  LDI r4, 0x3021
  STORE r4, r9

  ; move ball y
  LDI r4, 0x3022
  LOAD r9, r4
  LDI r4, 0x3024
  LOAD r5, r4
  ADD r9, r5
  LDI r4, 0x3022
  STORE r4, r9

  ; ── left wall bounce ──
  LDI r4, 0x3021
  LOAD r9, r4
  LDI r10, 0
  CMP r9, r10
  BGE r13, chk_rw
  LDI r9, 0
  LDI r4, 0x3021
  STORE r4, r9
  LDI r4, 0x3023
  LOAD r9, r4
  NEG r9
  LDI r4, 0x3023
  STORE r4, r9
  ; wall bounce sound
  LDI r7, 330
  LDI r10, 20
  BEEP r7, r10

chk_rw:
  ; ── right wall bounce ──
  LDI r4, 0x3021
  LOAD r9, r4
  LDI r10, 252          ; 256 - 4 (ball width)
  CMP r9, r10
  BLT r13, chk_tw
  LDI r9, 252
  LDI r4, 0x3021
  STORE r4, r9
  LDI r4, 0x3023
  LOAD r9, r4
  NEG r9
  LDI r4, 0x3023
  STORE r4, r9
  ; wall bounce sound
  LDI r7, 330
  LDI r10, 20
  BEEP r7, r10

chk_tw:
  ; ── top wall bounce ──
  LDI r4, 0x3022
  LOAD r9, r4
  LDI r10, 0
  CMP r9, r10
  BGE r13, chk_bot
  LDI r9, 0
  LDI r4, 0x3022
  STORE r4, r9
  LDI r4, 0x3024
  LOAD r9, r4
  NEG r9
  LDI r4, 0x3024
  STORE r4, r9
  ; wall bounce sound
  LDI r7, 330
  LDI r10, 20
  BEEP r7, r10

chk_bot:
  ; ── ball lost (fell off bottom) ──
  LDI r4, 0x3022
  LOAD r9, r4
  LDI r10, 256
  CMP r9, r10
  BLT r13, chk_brick
  CALL lose_life
  JMP draw_and_loop

chk_brick:
  ; ── brick collision ──
  LDI r4, 0x3022
  LOAD r9, r4          ; ball_y
  ; ball must be in brick area: y >= 8 and y < 40
  LDI r10, 8
  CMP r9, r10
  BLT r13, chk_paddle
  LDI r10, 40
  CMP r9, r10
  BGE r13, chk_paddle

  ; compute brick row = (ball_y - 8) >> 3
  LDI r7, 8
  SUB r9, r7
  LDI r7, 3
  SHR r9, r7           ; r9 = row (0-3)

  ; compute brick col = ball_x >> 5
  LDI r4, 0x3021
  LOAD r5, r4          ; ball_x
  LDI r7, 5
  SHR r5, r7           ; r5 = col (0-7)

  ; bounds check
  LDI r10, 4
  CMP r9, r10
  BGE r13, chk_paddle
  LDI r10, 8
  CMP r5, r10
  BGE r13, chk_paddle

  ; brick index = row * 8 + col
  LDI r12, 0
  ADD r12, r9
  LDI r7, 3
  SHL r12, r7           ; row * 8
  ADD r12, r5           ; + col

  ; check if brick alive
  LDI r4, 0x3000
  ADD r4, r12
  LOAD r9, r4
  JZ r9, chk_paddle   ; dead brick, skip

  ; kill brick
  LDI r9, 0
  STORE r4, r9

  ; decrement bricks_left
  LDI r4, 0x3029
  LOAD r9, r4
  LDI r7, 1
  SUB r9, r7
  LDI r4, 0x3029
  STORE r4, r9

  ; check win
  JNZ r9, brick_bounce
  LDI r9, 1
  LDI r4, 0x3027
  STORE r4, r9         ; game_over = 1 (won!)
  LDI r7, 880
  LDI r10, 200
  BEEP r7, r10
  JMP draw_and_loop

brick_bounce:
  ; reverse ball_dy
  LDI r4, 0x3024
  LOAD r9, r4
  NEG r9
  LDI r4, 0x3024
  STORE r4, r9
  ; score += 10
  LDI r4, 0x3025
  LOAD r9, r4
  LDI r7, 10
  ADD r9, r7
  LDI r4, 0x3025
  STORE r4, r9
  ; brick hit sound
  LDI r7, 660
  LDI r10, 30
  BEEP r7, r10

chk_paddle:
  ; ── paddle collision ──
  ; ball must be at paddle level (y >= 240) and moving down
  LDI r4, 0x3022
  LOAD r9, r4          ; ball_y
  LDI r10, 240
  CMP r9, r10
  BLT r13, draw_and_loop
  ; check ball moving down (dy > 0)
  LDI r4, 0x3024
  LOAD r9, r4
  LDI r10, 0
  CMP r9, r10
  BLT r13, draw_and_loop ; moving up, skip
  ; check x overlap (ball center vs paddle bounds)
  LDI r4, 0x3021
  LOAD r9, r4          ; ball_x
  LDI r4, 0x3020
  LOAD r5, r4          ; paddle_x
  LDI r7, 2
  ADD r9, r7           ; ball center x
  CMP r9, r5
  BLT r13, draw_and_loop ; left of paddle
  LDI r7, 48
  ADD r5, r7           ; paddle right edge
  CMP r9, r5
  BGE r13, draw_and_loop ; right of paddle

  ; paddle hit! reverse dy
  LDI r4, 0x3024
  LOAD r9, r4
  NEG r9
  LDI r4, 0x3024
  STORE r4, r9

  ; set dx from hit position (offset -24..24, clamped to -3..3)
  LDI r4, 0x3021
  LOAD r9, r4          ; ball_x
  LDI r7, 2
  ADD r9, r7           ; ball center x
  LDI r4, 0x3020
  LOAD r5, r4          ; paddle_x
  SUB r9, r5           ; offset (0-48)
  LDI r7, 24
  SUB r9, r7           ; -24..24

  ; clamp to [-3, 3]
  LDI r10, 0xFFFFFFFD   ; -3 unsigned
  CMP r9, r10
  BLT r13, dx_neg
  LDI r10, 3
  CMP r9, r10
  BGE r13, dx_pos
  JMP dx_store

dx_neg:
  LDI r9, 0xFFFFFFFD
  JMP dx_store

dx_pos:
  LDI r9, 3

dx_store:
  ; ensure dx is never 0 (would be boring)
  JNZ r9, dx_ok
  LDI r9, 1
dx_ok:
  LDI r4, 0x3023
  STORE r4, r9
  ; paddle hit sound
  LDI r7, 440
  LDI r10, 20
  BEEP r7, r10

draw_and_loop:
  CALL draw_frame
  FRAME
  JMP game_loop

; ── input handlers ───────────────────────────────────────────────
pad_left:
  LDI r4, 0x3020
  LOAD r9, r4
  LDI r7, 5
  SUB r9, r7
  LDI r10, 0
  CMP r9, r10
  BGE r13, pl_ok
  LDI r9, 0
pl_ok:
  LDI r4, 0x3020
  STORE r4, r9
  JMP after_input

pad_right:
  LDI r4, 0x3020
  LOAD r9, r4
  LDI r7, 5
  ADD r9, r7
  LDI r10, 208           ; 256 - 48
  CMP r9, r10
  BLT r13, pr_ok
  LDI r9, 208
pr_ok:
  LDI r4, 0x3020
  STORE r4, r9
  JMP after_input

do_launch:
  LDI r4, 0x3028
  LOAD r9, r4
  JNZ r9, after_input  ; already launched
  LDI r9, 1
  LDI r4, 0x3028
  STORE r4, r9
  JMP after_input

; ── subroutines ──────────────────────────────────────────────────
reset_ball:
  LDI r9, 0
  LDI r4, 0x3028
  STORE r4, r9         ; ball_launched = 0
  LDI r9, 2
  LDI r4, 0x3023
  STORE r4, r9         ; ball_dx = 2
  LDI r9, 0xFFFFFFFD   ; -3
  LDI r4, 0x3024
  STORE r4, r9         ; ball_dy = -3
  RET

lose_life:
  PUSH r31
  LDI r4, 0x3026
  LOAD r9, r4
  LDI r7, 1
  SUB r9, r7
  LDI r4, 0x3026
  STORE r4, r9
  JNZ r9, ll_reset
  ; game over (lost)
  LDI r9, 2
  LDI r4, 0x3027
  STORE r4, r9
  LDI r7, 110
  LDI r10, 300
  BEEP r7, r10
  POP r31
  RET

ll_reset:
  CALL reset_ball
  POP r31
  RET

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r4, 0x3027
  LOAD r9, r4
  LDI r10, 1
  CMP r9, r10
  JZ r13, win_screen

  ; lose screen (dark red)
  LDI r9, 0x330000
  FILL r9
  FRAME
  IKEY r8
  JZ r8, game_over_screen
  JMP restart

win_screen:
  ; win screen (dark green)
  LDI r9, 0x003300
  FILL r9
  FRAME
  IKEY r8
  JZ r8, win_screen
  JMP restart

; ─────────────────────────────────────────────────────────────────
; draw_frame -- render entire screen
;   Clobbers r9-r1, r3. Preserves r20-r25.
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; dark background
  LDI r9, 0x000811
  FILL r9

  ; ── draw bricks ──
  LDI r3, 0           ; brick index
  LDI r20, 0x3000      ; brick base

df_bloop:
  ; load brick color
  LDI r4, 0
  ADD r4, r20
  ADD r4, r3
  LOAD r9, r4          ; r9 = color (0 = dead)
  JZ r9, df_bnext

  ; compute pixel position
  LDI r7, 0
  ADD r7, r3
  LDI r10, 7
  AND r7, r10           ; r7 = col (0-7)
  LDI r2, 5
  SHL r7, r2           ; r7 = col * 32

  LDI r10, 0
  ADD r10, r3
  LDI r2, 3
  SHR r10, r2           ; r10 = row (0-3)
  LDI r2, 3
  SHL r10, r2           ; r10 = row * 8
  LDI r2, 9
  ADD r10, r2           ; r10 = row * 8 + 9 (1px top gap)

  ; draw brick: RECTF(x+1, y+1, 30, 6, color)
  LDI r8, 1
  ADD r7, r8           ; x + 1
  ADD r10, r8           ; y + 1
  LDI r8, 30           ; width
  LDI r2, 6            ; height
  RECTF r7, r10, r8, r2, r9

df_bnext:
  LDI r7, 1
  ADD r3, r7
  LDI r10, 32
  CMP r3, r10
  BLT r13, df_bloop

  ; ── draw paddle ──
  LDI r4, 0x3020
  LOAD r7, r4          ; r7 = paddle_x
  LDI r10, 244           ; y
  LDI r8, 48            ; width
  LDI r2, 6             ; height
  LDI r1, 0xCCCCCC      ; light gray
  RECTF r7, r10, r8, r2, r1

  ; ── draw ball ──
  LDI r4, 0x3021
  LOAD r7, r4          ; ball_x
  LDI r4, 0x3022
  LOAD r10, r4          ; ball_y
  LDI r8, 4            ; width
  LDI r2, 4            ; height
  LDI r1, 0xFFFFFF     ; white
  RECTF r7, r10, r8, r2, r1

  ; ── draw score text ──
  CALL draw_score

  ; ── draw lives (small rects at bottom-right) ──
  LDI r4, 0x3026
  LOAD r9, r4          ; lives
  LDI r1, 0            ; loop counter
  LDI r3, 240         ; x start
df_lloop:
  CMP r1, r9
  BGE r13, df_ldone
  LDI r7, 0
  ADD r7, r3
  LDI r10, 252           ; y
  LDI r8, 4             ; w
  LDI r2, 4             ; h
  LDI r5, 0x00CC44     ; green
  RECTF r7, r10, r8, r2, r5
  LDI r7, 6
  ADD r3, r7           ; next life dot x += 6
  LDI r7, 1
  ADD r1, r7
  JMP df_lloop

df_ldone:
  RET

; ─────────────────────────────────────────────────────────────────
; draw_score -- convert score to 3-digit ASCII and display with TEXT
;   Writes digits to RAM[0x3106..0x3108], null at 0x3109
; ─────────────────────────────────────────────────────────────────
draw_score:
  LDI r4, 0x3025
  LOAD r9, r4          ; r9 = score

  ; hundreds digit: score / 100
  LDI r5, 0
  ADD r5, r9           ; r5 = score copy
  LDI r12, 100
  DIV r5, r12           ; r5 = hundreds
  LDI r7, 48
  ADD r5, r7           ; r5 = '0' + hundreds
  LDI r4, 0x3106
  STORE r4, r5

  ; tens digit: (score - hundreds*100) / 10
  LDI r12, 100
  LDI r10, 0
  ADD r10, r5           ; r10 = ASCII hundreds
  LDI r7, 48
  SUB r10, r7           ; r10 = numeric hundreds
  MUL r10, r12           ; r10 = hundreds * 100
  LDI r5, 0
  ADD r5, r9           ; r5 = score
  SUB r5, r10           ; r5 = remainder (< 100)
  LDI r12, 10
  DIV r5, r12           ; r5 = tens
  LDI r7, 48
  ADD r5, r7           ; r5 = '0' + tens
  LDI r4, 0x3107
  STORE r4, r5

  ; ones digit: remainder - tens*10
  LDI r12, 10
  LDI r10, 0
  ADD r10, r5           ; r10 = ASCII tens
  LDI r7, 48
  SUB r10, r7           ; r10 = numeric tens
  MUL r10, r12           ; r10 = tens * 10
  SUB r5, r10           ; r5 = ones
  LDI r7, 48
  ADD r5, r7           ; r5 = '0' + ones
  LDI r4, 0x3108
  STORE r4, r5

  ; null terminator
  LDI r9, 0
  LDI r4, 0x3109
  STORE r4, r9

  ; TEXT opcode to render "SCORE:XXX"
  LDI r7, 2             ; x
  LDI r10, 0             ; y
  LDI r8, 0x3100        ; string address
  TEXT r7, r10, r8

  RET
