; DESCRIPTION: This GeOS assembly code implements a classic Breakout game. The game features a paddle controlled by the player to bounce a ball back at bricks arranged in rows at the top of the screen. The player earns points for breaking bricks and can restart the game with 'R'. The game ends if the ball falls below the paddle, reducing lives until none are left.

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
  LDI r13, 0x3100
  LDI r12, 83
  STORE r13, r12        ; S
  LDI r13, 0x3101
  LDI r12, 67
  STORE r13, r12        ; C
  LDI r13, 0x3102
  LDI r12, 79
  STORE r13, r12        ; O
  LDI r13, 0x3103
  LDI r12, 82
  STORE r13, r12        ; R
  LDI r13, 0x3104
  LDI r12, 69
  STORE r13, r12        ; E
  LDI r13, 0x3105
  LDI r12, 58
  STORE r13, r12        ; :

  ; init bricks -- row 0=red, row 1=orange, row 2=yellow, row 3=green
  LDI r22, 0xFF0000   ; red
  LDI r23, 0xFF8800   ; orange
  LDI r24, 0xFFDD00   ; yellow
  LDI r25, 0x00CC44   ; green
  LDI r2, 0          ; brick index

ib_loop:
  LDI r4, 0
  ADD r4, r2
  LDI r1, 3
  SHR r4, r1          ; r4 = row (0-3)
  ; default green (row 3)
  LDI r12, 0
  ADD r12, r25
  ; check row 0
  LDI r1, 0
  CMP r4, r1
  JZ r15, ib_r0
  ; check row 1
  LDI r1, 1
  CMP r4, r1
  JZ r15, ib_r1
  ; check row 2
  LDI r1, 2
  CMP r4, r1
  JZ r15, ib_r2
  JMP ib_store        ; row 3 = green (already in r12)

ib_r0:
  LDI r12, 0
  ADD r12, r22         ; red
  JMP ib_store

ib_r1:
  LDI r12, 0
  ADD r12, r23         ; orange
  JMP ib_store

ib_r2:
  LDI r12, 0
  ADD r12, r24         ; yellow

ib_store:
  LDI r13, 0x3000
  ADD r13, r2
  STORE r13, r12
  LDI r4, 1
  ADD r2, r4
  LDI r1, 32
  CMP r2, r1
  BLT r15, ib_loop

  ; init game state
  LDI r12, 104
  LDI r13, 0x3020
  STORE r13, r12        ; paddle_x = 104 (centered)
  LDI r12, 0
  LDI r13, 0x3025
  STORE r13, r12        ; score = 0
  LDI r12, 3
  LDI r13, 0x3026
  STORE r13, r12        ; lives = 3
  LDI r12, 0
  LDI r13, 0x3027
  STORE r13, r12        ; game_over = 0
  LDI r12, 32
  LDI r13, 0x3029
  STORE r13, r12        ; bricks_left = 32

  CALL reset_ball

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r13, 0x3027
  LOAD r12, r13
  JNZ r12, game_over_screen

  ; read keyboard
  IKEY r5

  ; A/a = paddle left
  LDI r1, 65
  CMP r5, r1
  JZ r15, pad_left
  LDI r1, 97
  CMP r5, r1
  JZ r15, pad_left

  ; D/d = paddle right
  LDI r1, 68
  CMP r5, r1
  JZ r15, pad_right
  LDI r1, 100
  CMP r5, r1
  JZ r15, pad_right

  ; W/w/Space = launch ball
  LDI r1, 87
  CMP r5, r1
  JZ r15, do_launch
  LDI r1, 119
  CMP r5, r1
  JZ r15, do_launch
  LDI r1, 32
  CMP r5, r1
  JZ r15, do_launch

  ; R/r = restart
  LDI r1, 82
  CMP r5, r1
  JZ r15, restart
  LDI r1, 114
  CMP r5, r1
  JZ r15, restart

after_input:
  ; if ball not launched, stick to paddle
  LDI r13, 0x3028
  LOAD r12, r13
  JNZ r12, update_ball

  ; ball sits on paddle
  LDI r13, 0x3020
  LOAD r12, r13          ; paddle_x
  LDI r4, 22
  ADD r12, r4           ; center ball on paddle
  LDI r13, 0x3021
  STORE r13, r12         ; ball_x
  LDI r12, 240
  LDI r13, 0x3022
  STORE r13, r12         ; ball_y = 240
  JMP draw_and_loop

update_ball:
  ; move ball x
  LDI r13, 0x3021
  LOAD r12, r13
  LDI r13, 0x3023
  LOAD r14, r13
  ADD r12, r14
  LDI r13, 0x3021
  STORE r13, r12

  ; move ball y
  LDI r13, 0x3022
  LOAD r12, r13
  LDI r13, 0x3024
  LOAD r14, r13
  ADD r12, r14
  LDI r13, 0x3022
  STORE r13, r12

  ; ── left wall bounce ──
  LDI r13, 0x3021
  LOAD r12, r13
  LDI r1, 0
  CMP r12, r1
  BGE r15, chk_rw
  LDI r12, 0
  LDI r13, 0x3021
  STORE r13, r12
  LDI r13, 0x3023
  LOAD r12, r13
  NEG r12
  LDI r13, 0x3023
  STORE r13, r12
  ; wall bounce sound
  LDI r4, 330
  LDI r1, 20
  BEEP r4, r1

chk_rw:
  ; ── right wall bounce ──
  LDI r13, 0x3021
  LOAD r12, r13
  LDI r1, 252          ; 256 - 4 (ball width)
  CMP r12, r1
  BLT r15, chk_tw
  LDI r12, 252
  LDI r13, 0x3021
  STORE r13, r12
  LDI r13, 0x3023
  LOAD r12, r13
  NEG r12
  LDI r13, 0x3023
  STORE r13, r12
  ; wall bounce sound
  LDI r4, 330
  LDI r1, 20
  BEEP r4, r1

chk_tw:
  ; ── top wall bounce ──
  LDI r13, 0x3022
  LOAD r12, r13
  LDI r1, 0
  CMP r12, r1
  BGE r15, chk_bot
  LDI r12, 0
  LDI r13, 0x3022
  STORE r13, r12
  LDI r13, 0x3024
  LOAD r12, r13
  NEG r12
  LDI r13, 0x3024
  STORE r13, r12
  ; wall bounce sound
  LDI r4, 330
  LDI r1, 20
  BEEP r4, r1

chk_bot:
  ; ── ball lost (fell off bottom) ──
  LDI r13, 0x3022
  LOAD r12, r13
  LDI r1, 256
  CMP r12, r1
  BLT r15, chk_brick
  CALL lose_life
  JMP draw_and_loop

chk_brick:
  ; ── brick collision ──
  LDI r13, 0x3022
  LOAD r12, r13          ; ball_y
  ; ball must be in brick area: y >= 8 and y < 40
  LDI r1, 8
  CMP r12, r1
  BLT r15, chk_paddle
  LDI r1, 40
  CMP r12, r1
  BGE r15, chk_paddle

  ; compute brick row = (ball_y - 8) >> 3
  LDI r4, 8
  SUB r12, r4
  LDI r4, 3
  SHR r12, r4           ; r12 = row (0-3)

  ; compute brick col = ball_x >> 5
  LDI r13, 0x3021
  LOAD r14, r13          ; ball_x
  LDI r4, 5
  SHR r14, r4           ; r14 = col (0-7)

  ; bounds check
  LDI r1, 4
  CMP r12, r1
  BGE r15, chk_paddle
  LDI r1, 8
  CMP r14, r1
  BGE r15, chk_paddle

  ; brick index = row * 8 + col
  LDI r0, 0
  ADD r0, r12
  LDI r4, 3
  SHL r0, r4           ; row * 8
  ADD r0, r14           ; + col

  ; check if brick alive
  LDI r13, 0x3000
  ADD r13, r0
  LOAD r12, r13
  JZ r12, chk_paddle   ; dead brick, skip

  ; kill brick
  LDI r12, 0
  STORE r13, r12

  ; decrement bricks_left
  LDI r13, 0x3029
  LOAD r12, r13
  LDI r4, 1
  SUB r12, r4
  LDI r13, 0x3029
  STORE r13, r12

  ; check win
  JNZ r12, brick_bounce
  LDI r12, 1
  LDI r13, 0x3027
  STORE r13, r12         ; game_over = 1 (won!)
  LDI r4, 880
  LDI r1, 200
  BEEP r4, r1
  JMP draw_and_loop

brick_bounce:
  ; reverse ball_dy
  LDI r13, 0x3024
  LOAD r12, r13
  NEG r12
  LDI r13, 0x3024
  STORE r13, r12
  ; score += 10
  LDI r13, 0x3025
  LOAD r12, r13
  LDI r4, 10
  ADD r12, r4
  LDI r13, 0x3025
  STORE r13, r12
  ; brick hit sound
  LDI r4, 660
  LDI r1, 30
  BEEP r4, r1

chk_paddle:
  ; ── paddle collision ──
  ; ball must be at paddle level (y >= 240) and moving down
  LDI r13, 0x3022
  LOAD r12, r13          ; ball_y
  LDI r1, 240
  CMP r12, r1
  BLT r15, draw_and_loop
  ; check ball moving down (dy > 0)
  LDI r13, 0x3024
  LOAD r12, r13
  LDI r1, 0
  CMP r12, r1
  BLT r15, draw_and_loop ; moving up, skip
  ; check x overlap (ball center vs paddle bounds)
  LDI r13, 0x3021
  LOAD r12, r13          ; ball_x
  LDI r13, 0x3020
  LOAD r14, r13          ; paddle_x
  LDI r4, 2
  ADD r12, r4           ; ball center x
  CMP r12, r14
  BLT r15, draw_and_loop ; left of paddle
  LDI r4, 48
  ADD r14, r4           ; paddle right edge
  CMP r12, r14
  BGE r15, draw_and_loop ; right of paddle

  ; paddle hit! reverse dy
  LDI r13, 0x3024
  LOAD r12, r13
  NEG r12
  LDI r13, 0x3024
  STORE r13, r12

  ; set dx from hit position (offset -24..24, clamped to -3..3)
  LDI r13, 0x3021
  LOAD r12, r13          ; ball_x
  LDI r4, 2
  ADD r12, r4           ; ball center x
  LDI r13, 0x3020
  LOAD r14, r13          ; paddle_x
  SUB r12, r14           ; offset (0-48)
  LDI r4, 24
  SUB r12, r4           ; -24..24

  ; clamp to [-3, 3]
  LDI r1, 0xFFFFFFFD   ; -3 unsigned
  CMP r12, r1
  BLT r15, dx_neg
  LDI r1, 3
  CMP r12, r1
  BGE r15, dx_pos
  JMP dx_store

dx_neg:
  LDI r12, 0xFFFFFFFD
  JMP dx_store

dx_pos:
  LDI r12, 3

dx_store:
  ; ensure dx is never 0 (would be boring)
  JNZ r12, dx_ok
  LDI r12, 1
dx_ok:
  LDI r13, 0x3023
  STORE r13, r12
  ; paddle hit sound
  LDI r4, 440
  LDI r1, 20
  BEEP r4, r1

draw_and_loop:
  CALL draw_frame
  FRAME
  JMP game_loop

; ── input handlers ───────────────────────────────────────────────
pad_left:
  LDI r13, 0x3020
  LOAD r12, r13
  LDI r4, 5
  SUB r12, r4
  LDI r1, 0
  CMP r12, r1
  BGE r15, pl_ok
  LDI r12, 0
pl_ok:
  LDI r13, 0x3020
  STORE r13, r12
  JMP after_input

pad_right:
  LDI r13, 0x3020
  LOAD r12, r13
  LDI r4, 5
  ADD r12, r4
  LDI r1, 208           ; 256 - 48
  CMP r12, r1
  BLT r15, pr_ok
  LDI r12, 208
pr_ok:
  LDI r13, 0x3020
  STORE r13, r12
  JMP after_input

do_launch:
  LDI r13, 0x3028
  LOAD r12, r13
  JNZ r12, after_input  ; already launched
  LDI r12, 1
  LDI r13, 0x3028
  STORE r13, r12
  JMP after_input

; ── subroutines ──────────────────────────────────────────────────
reset_ball:
  LDI r12, 0
  LDI r13, 0x3028
  STORE r13, r12         ; ball_launched = 0
  LDI r12, 2
  LDI r13, 0x3023
  STORE r13, r12         ; ball_dx = 2
  LDI r12, 0xFFFFFFFD   ; -3
  LDI r13, 0x3024
  STORE r13, r12         ; ball_dy = -3
  RET

lose_life:
  PUSH r31
  LDI r13, 0x3026
  LOAD r12, r13
  LDI r4, 1
  SUB r12, r4
  LDI r13, 0x3026
  STORE r13, r12
  JNZ r12, ll_reset
  ; game over (lost)
  LDI r12, 2
  LDI r13, 0x3027
  STORE r13, r12
  LDI r4, 110
  LDI r1, 300
  BEEP r4, r1
  POP r31
  RET

ll_reset:
  CALL reset_ball
  POP r31
  RET

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r13, 0x3027
  LOAD r12, r13
  LDI r1, 1
  CMP r12, r1
  JZ r15, win_screen

  ; lose screen (dark red)
  LDI r12, 0x330000
  FILL r12
  FRAME
  IKEY r5
  JZ r5, game_over_screen
  JMP restart

win_screen:
  ; win screen (dark green)
  LDI r12, 0x003300
  FILL r12
  FRAME
  IKEY r5
  JZ r5, win_screen
  JMP restart

; ─────────────────────────────────────────────────────────────────
; draw_frame -- render entire screen
;   Clobbers r12-r3, r2. Preserves r20-r25.
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; dark background
  LDI r12, 0x000811
  FILL r12

  ; ── draw bricks ──
  LDI r2, 0           ; brick index
  LDI r20, 0x3000      ; brick base

df_bloop:
  ; load brick color
  LDI r13, 0
  ADD r13, r20
  ADD r13, r2
  LOAD r12, r13          ; r12 = color (0 = dead)
  JZ r12, df_bnext

  ; compute pixel position
  LDI r4, 0
  ADD r4, r2
  LDI r1, 7
  AND r4, r1           ; r4 = col (0-7)
  LDI r11, 5
  SHL r4, r11           ; r4 = col * 32

  LDI r1, 0
  ADD r1, r2
  LDI r11, 3
  SHR r1, r11           ; r1 = row (0-3)
  LDI r11, 3
  SHL r1, r11           ; r1 = row * 8
  LDI r11, 9
  ADD r1, r11           ; r1 = row * 8 + 9 (1px top gap)

  ; draw brick: RECTF(x+1, y+1, 30, 6, color)
  LDI r5, 1
  ADD r4, r5           ; x + 1
  ADD r1, r5           ; y + 1
  LDI r5, 30           ; width
  LDI r11, 6            ; height
  RECTF r4, r1, r5, r11, r12

df_bnext:
  LDI r4, 1
  ADD r2, r4
  LDI r1, 32
  CMP r2, r1
  BLT r15, df_bloop

  ; ── draw paddle ──
  LDI r13, 0x3020
  LOAD r4, r13          ; r4 = paddle_x
  LDI r1, 244           ; y
  LDI r5, 48            ; width
  LDI r11, 6             ; height
  LDI r3, 0xCCCCCC      ; light gray
  RECTF r4, r1, r5, r11, r3

  ; ── draw ball ──
  LDI r13, 0x3021
  LOAD r4, r13          ; ball_x
  LDI r13, 0x3022
  LOAD r1, r13          ; ball_y
  LDI r5, 4            ; width
  LDI r11, 4            ; height
  LDI r3, 0xFFFFFF     ; white
  RECTF r4, r1, r5, r11, r3

  ; ── draw score text ──
  CALL draw_score

  ; ── draw lives (small rects at bottom-right) ──
  LDI r13, 0x3026
  LOAD r12, r13          ; lives
  LDI r3, 0            ; loop counter
  LDI r2, 240         ; x start
df_lloop:
  CMP r3, r12
  BGE r15, df_ldone
  LDI r4, 0
  ADD r4, r2
  LDI r1, 252           ; y
  LDI r5, 4             ; w
  LDI r11, 4             ; h
  LDI r14, 0x00CC44     ; green
  RECTF r4, r1, r5, r11, r14
  LDI r4, 6
  ADD r2, r4           ; next life dot x += 6
  LDI r4, 1
  ADD r3, r4
  JMP df_lloop

df_ldone:
  RET

; ─────────────────────────────────────────────────────────────────
; draw_score -- convert score to 3-digit ASCII and display with TEXT
;   Writes digits to RAM[0x3106..0x3108], null at 0x3109
; ─────────────────────────────────────────────────────────────────
draw_score:
  LDI r13, 0x3025
  LOAD r12, r13          ; r12 = score

  ; hundreds digit: score / 100
  LDI r14, 0
  ADD r14, r12           ; r14 = score copy
  LDI r0, 100
  DIV r14, r0           ; r14 = hundreds
  LDI r4, 48
  ADD r14, r4           ; r14 = '0' + hundreds
  LDI r13, 0x3106
  STORE r13, r14

  ; tens digit: (score - hundreds*100) / 10
  LDI r0, 100
  LDI r1, 0
  ADD r1, r14           ; r1 = ASCII hundreds
  LDI r4, 48
  SUB r1, r4           ; r1 = numeric hundreds
  MUL r1, r0           ; r1 = hundreds * 100
  LDI r14, 0
  ADD r14, r12           ; r14 = score
  SUB r14, r1           ; r14 = remainder (< 100)
  LDI r0, 10
  DIV r14, r0           ; r14 = tens
  LDI r4, 48
  ADD r14, r4           ; r14 = '0' + tens
  LDI r13, 0x3107
  STORE r13, r14

  ; ones digit: remainder - tens*10
  LDI r0, 10
  LDI r1, 0
  ADD r1, r14           ; r1 = ASCII tens
  LDI r4, 48
  SUB r1, r4           ; r1 = numeric tens
  MUL r1, r0           ; r1 = tens * 10
  SUB r14, r1           ; r14 = ones
  LDI r4, 48
  ADD r14, r4           ; r14 = '0' + ones
  LDI r13, 0x3108
  STORE r13, r14

  ; null terminator
  LDI r12, 0
  LDI r13, 0x3109
  STORE r13, r12

  ; TEXT opcode to render "SCORE:XXX"
  LDI r4, 2             ; x
  LDI r1, 0             ; y
  LDI r5, 0x3100        ; string address
  TEXT r4, r1, r5

  RET
