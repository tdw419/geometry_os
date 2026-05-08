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
  LDI r14, 83
  STORE r13, r14        ; S
  LDI r13, 0x3101
  LDI r14, 67
  STORE r13, r14        ; C
  LDI r13, 0x3102
  LDI r14, 79
  STORE r13, r14        ; O
  LDI r13, 0x3103
  LDI r14, 82
  STORE r13, r14        ; R
  LDI r13, 0x3104
  LDI r14, 69
  STORE r13, r14        ; E
  LDI r13, 0x3105
  LDI r14, 58
  STORE r13, r14        ; :

  ; init bricks -- row 0=red, row 1=orange, row 2=yellow, row 3=green
  LDI r22, 0xFF0000   ; red
  LDI r23, 0xFF8800   ; orange
  LDI r24, 0xFFDD00   ; yellow
  LDI r25, 0x00CC44   ; green
  LDI r15, 0          ; brick index

ib_loop:
  LDI r7, 0
  ADD r7, r15
  LDI r11, 3
  SHR r7, r11          ; r7 = row (0-3)
  ; default green (row 3)
  LDI r14, 0
  ADD r14, r25
  ; check row 0
  LDI r11, 0
  CMP r7, r11
  JZ r6, ib_r0
  ; check row 1
  LDI r11, 1
  CMP r7, r11
  JZ r6, ib_r1
  ; check row 2
  LDI r11, 2
  CMP r7, r11
  JZ r6, ib_r2
  JMP ib_store        ; row 3 = green (already in r14)

ib_r0:
  LDI r14, 0
  ADD r14, r22         ; red
  JMP ib_store

ib_r1:
  LDI r14, 0
  ADD r14, r23         ; orange
  JMP ib_store

ib_r2:
  LDI r14, 0
  ADD r14, r24         ; yellow

ib_store:
  LDI r13, 0x3000
  ADD r13, r15
  STORE r13, r14
  LDI r7, 1
  ADD r15, r7
  LDI r11, 32
  CMP r15, r11
  BLT r6, ib_loop

  ; init game state
  LDI r14, 104
  LDI r13, 0x3020
  STORE r13, r14        ; paddle_x = 104 (centered)
  LDI r14, 0
  LDI r13, 0x3025
  STORE r13, r14        ; score = 0
  LDI r14, 3
  LDI r13, 0x3026
  STORE r13, r14        ; lives = 3
  LDI r14, 0
  LDI r13, 0x3027
  STORE r13, r14        ; game_over = 0
  LDI r14, 32
  LDI r13, 0x3029
  STORE r13, r14        ; bricks_left = 32

  CALL reset_ball

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r13, 0x3027
  LOAD r14, r13
  JNZ r14, game_over_screen

  ; read keyboard
  IKEY r3

  ; A/a = paddle left
  LDI r11, 65
  CMP r3, r11
  JZ r6, pad_left
  LDI r11, 97
  CMP r3, r11
  JZ r6, pad_left

  ; D/d = paddle right
  LDI r11, 68
  CMP r3, r11
  JZ r6, pad_right
  LDI r11, 100
  CMP r3, r11
  JZ r6, pad_right

  ; W/w/Space = launch ball
  LDI r11, 87
  CMP r3, r11
  JZ r6, do_launch
  LDI r11, 119
  CMP r3, r11
  JZ r6, do_launch
  LDI r11, 32
  CMP r3, r11
  JZ r6, do_launch

  ; R/r = restart
  LDI r11, 82
  CMP r3, r11
  JZ r6, restart
  LDI r11, 114
  CMP r3, r11
  JZ r6, restart

after_input:
  ; if ball not launched, stick to paddle
  LDI r13, 0x3028
  LOAD r14, r13
  JNZ r14, update_ball

  ; ball sits on paddle
  LDI r13, 0x3020
  LOAD r14, r13          ; paddle_x
  LDI r7, 22
  ADD r14, r7           ; center ball on paddle
  LDI r13, 0x3021
  STORE r13, r14         ; ball_x
  LDI r14, 240
  LDI r13, 0x3022
  STORE r13, r14         ; ball_y = 240
  JMP draw_and_loop

update_ball:
  ; move ball x
  LDI r13, 0x3021
  LOAD r14, r13
  LDI r13, 0x3023
  LOAD r4, r13
  ADD r14, r4
  LDI r13, 0x3021
  STORE r13, r14

  ; move ball y
  LDI r13, 0x3022
  LOAD r14, r13
  LDI r13, 0x3024
  LOAD r4, r13
  ADD r14, r4
  LDI r13, 0x3022
  STORE r13, r14

  ; ── left wall bounce ──
  LDI r13, 0x3021
  LOAD r14, r13
  LDI r11, 0
  CMP r14, r11
  BGE r6, chk_rw
  LDI r14, 0
  LDI r13, 0x3021
  STORE r13, r14
  LDI r13, 0x3023
  LOAD r14, r13
  NEG r14
  LDI r13, 0x3023
  STORE r13, r14
  ; wall bounce sound
  LDI r7, 330
  LDI r11, 20
  BEEP r7, r11

chk_rw:
  ; ── right wall bounce ──
  LDI r13, 0x3021
  LOAD r14, r13
  LDI r11, 252          ; 256 - 4 (ball width)
  CMP r14, r11
  BLT r6, chk_tw
  LDI r14, 252
  LDI r13, 0x3021
  STORE r13, r14
  LDI r13, 0x3023
  LOAD r14, r13
  NEG r14
  LDI r13, 0x3023
  STORE r13, r14
  ; wall bounce sound
  LDI r7, 330
  LDI r11, 20
  BEEP r7, r11

chk_tw:
  ; ── top wall bounce ──
  LDI r13, 0x3022
  LOAD r14, r13
  LDI r11, 0
  CMP r14, r11
  BGE r6, chk_bot
  LDI r14, 0
  LDI r13, 0x3022
  STORE r13, r14
  LDI r13, 0x3024
  LOAD r14, r13
  NEG r14
  LDI r13, 0x3024
  STORE r13, r14
  ; wall bounce sound
  LDI r7, 330
  LDI r11, 20
  BEEP r7, r11

chk_bot:
  ; ── ball lost (fell off bottom) ──
  LDI r13, 0x3022
  LOAD r14, r13
  LDI r11, 256
  CMP r14, r11
  BLT r6, chk_brick
  CALL lose_life
  JMP draw_and_loop

chk_brick:
  ; ── brick collision ──
  LDI r13, 0x3022
  LOAD r14, r13          ; ball_y
  ; ball must be in brick area: y >= 8 and y < 40
  LDI r11, 8
  CMP r14, r11
  BLT r6, chk_paddle
  LDI r11, 40
  CMP r14, r11
  BGE r6, chk_paddle

  ; compute brick row = (ball_y - 8) >> 3
  LDI r7, 8
  SUB r14, r7
  LDI r7, 3
  SHR r14, r7           ; r14 = row (0-3)

  ; compute brick col = ball_x >> 5
  LDI r13, 0x3021
  LOAD r4, r13          ; ball_x
  LDI r7, 5
  SHR r4, r7           ; r4 = col (0-7)

  ; bounds check
  LDI r11, 4
  CMP r14, r11
  BGE r6, chk_paddle
  LDI r11, 8
  CMP r4, r11
  BGE r6, chk_paddle

  ; brick index = row * 8 + col
  LDI r12, 0
  ADD r12, r14
  LDI r7, 3
  SHL r12, r7           ; row * 8
  ADD r12, r4           ; + col

  ; check if brick alive
  LDI r13, 0x3000
  ADD r13, r12
  LOAD r14, r13
  JZ r14, chk_paddle   ; dead brick, skip

  ; kill brick
  LDI r14, 0
  STORE r13, r14

  ; decrement bricks_left
  LDI r13, 0x3029
  LOAD r14, r13
  LDI r7, 1
  SUB r14, r7
  LDI r13, 0x3029
  STORE r13, r14

  ; check win
  JNZ r14, brick_bounce
  LDI r14, 1
  LDI r13, 0x3027
  STORE r13, r14         ; game_over = 1 (won!)
  LDI r7, 880
  LDI r11, 200
  BEEP r7, r11
  JMP draw_and_loop

brick_bounce:
  ; reverse ball_dy
  LDI r13, 0x3024
  LOAD r14, r13
  NEG r14
  LDI r13, 0x3024
  STORE r13, r14
  ; score += 10
  LDI r13, 0x3025
  LOAD r14, r13
  LDI r7, 10
  ADD r14, r7
  LDI r13, 0x3025
  STORE r13, r14
  ; brick hit sound
  LDI r7, 660
  LDI r11, 30
  BEEP r7, r11

chk_paddle:
  ; ── paddle collision ──
  ; ball must be at paddle level (y >= 240) and moving down
  LDI r13, 0x3022
  LOAD r14, r13          ; ball_y
  LDI r11, 240
  CMP r14, r11
  BLT r6, draw_and_loop
  ; check ball moving down (dy > 0)
  LDI r13, 0x3024
  LOAD r14, r13
  LDI r11, 0
  CMP r14, r11
  BLT r6, draw_and_loop ; moving up, skip
  ; check x overlap (ball center vs paddle bounds)
  LDI r13, 0x3021
  LOAD r14, r13          ; ball_x
  LDI r13, 0x3020
  LOAD r4, r13          ; paddle_x
  LDI r7, 2
  ADD r14, r7           ; ball center x
  CMP r14, r4
  BLT r6, draw_and_loop ; left of paddle
  LDI r7, 48
  ADD r4, r7           ; paddle right edge
  CMP r14, r4
  BGE r6, draw_and_loop ; right of paddle

  ; paddle hit! reverse dy
  LDI r13, 0x3024
  LOAD r14, r13
  NEG r14
  LDI r13, 0x3024
  STORE r13, r14

  ; set dx from hit position (offset -24..24, clamped to -3..3)
  LDI r13, 0x3021
  LOAD r14, r13          ; ball_x
  LDI r7, 2
  ADD r14, r7           ; ball center x
  LDI r13, 0x3020
  LOAD r4, r13          ; paddle_x
  SUB r14, r4           ; offset (0-48)
  LDI r7, 24
  SUB r14, r7           ; -24..24

  ; clamp to [-3, 3]
  LDI r11, 0xFFFFFFFD   ; -3 unsigned
  CMP r14, r11
  BLT r6, dx_neg
  LDI r11, 3
  CMP r14, r11
  BGE r6, dx_pos
  JMP dx_store

dx_neg:
  LDI r14, 0xFFFFFFFD
  JMP dx_store

dx_pos:
  LDI r14, 3

dx_store:
  ; ensure dx is never 0 (would be boring)
  JNZ r14, dx_ok
  LDI r14, 1
dx_ok:
  LDI r13, 0x3023
  STORE r13, r14
  ; paddle hit sound
  LDI r7, 440
  LDI r11, 20
  BEEP r7, r11

draw_and_loop:
  CALL draw_frame
  FRAME
  JMP game_loop

; ── input handlers ───────────────────────────────────────────────
pad_left:
  LDI r13, 0x3020
  LOAD r14, r13
  LDI r7, 5
  SUB r14, r7
  LDI r11, 0
  CMP r14, r11
  BGE r6, pl_ok
  LDI r14, 0
pl_ok:
  LDI r13, 0x3020
  STORE r13, r14
  JMP after_input

pad_right:
  LDI r13, 0x3020
  LOAD r14, r13
  LDI r7, 5
  ADD r14, r7
  LDI r11, 208           ; 256 - 48
  CMP r14, r11
  BLT r6, pr_ok
  LDI r14, 208
pr_ok:
  LDI r13, 0x3020
  STORE r13, r14
  JMP after_input

do_launch:
  LDI r13, 0x3028
  LOAD r14, r13
  JNZ r14, after_input  ; already launched
  LDI r14, 1
  LDI r13, 0x3028
  STORE r13, r14
  JMP after_input

; ── subroutines ──────────────────────────────────────────────────
reset_ball:
  LDI r14, 0
  LDI r13, 0x3028
  STORE r13, r14         ; ball_launched = 0
  LDI r14, 2
  LDI r13, 0x3023
  STORE r13, r14         ; ball_dx = 2
  LDI r14, 0xFFFFFFFD   ; -3
  LDI r13, 0x3024
  STORE r13, r14         ; ball_dy = -3
  RET

lose_life:
  PUSH r31
  LDI r13, 0x3026
  LOAD r14, r13
  LDI r7, 1
  SUB r14, r7
  LDI r13, 0x3026
  STORE r13, r14
  JNZ r14, ll_reset
  ; game over (lost)
  LDI r14, 2
  LDI r13, 0x3027
  STORE r13, r14
  LDI r7, 110
  LDI r11, 300
  BEEP r7, r11
  POP r31
  RET

ll_reset:
  CALL reset_ball
  POP r31
  RET

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r13, 0x3027
  LOAD r14, r13
  LDI r11, 1
  CMP r14, r11
  JZ r6, win_screen

  ; lose screen (dark red)
  LDI r14, 0x330000
  FILL r14
  FRAME
  IKEY r3
  JZ r3, game_over_screen
  JMP restart

win_screen:
  ; win screen (dark green)
  LDI r14, 0x003300
  FILL r14
  FRAME
  IKEY r3
  JZ r3, win_screen
  JMP restart

; ─────────────────────────────────────────────────────────────────
; draw_frame -- render entire screen
;   Clobbers r14-r5, r15. Preserves r20-r25.
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; dark background
  LDI r14, 0x000811
  FILL r14

  ; ── draw bricks ──
  LDI r15, 0           ; brick index
  LDI r20, 0x3000      ; brick base

df_bloop:
  ; load brick color
  LDI r13, 0
  ADD r13, r20
  ADD r13, r15
  LOAD r14, r13          ; r14 = color (0 = dead)
  JZ r14, df_bnext

  ; compute pixel position
  LDI r7, 0
  ADD r7, r15
  LDI r11, 7
  AND r7, r11           ; r7 = col (0-7)
  LDI r2, 5
  SHL r7, r2           ; r7 = col * 32

  LDI r11, 0
  ADD r11, r15
  LDI r2, 3
  SHR r11, r2           ; r11 = row (0-3)
  LDI r2, 3
  SHL r11, r2           ; r11 = row * 8
  LDI r2, 9
  ADD r11, r2           ; r11 = row * 8 + 9 (1px top gap)

  ; draw brick: RECTF(x+1, y+1, 30, 6, color)
  LDI r3, 1
  ADD r7, r3           ; x + 1
  ADD r11, r3           ; y + 1
  LDI r3, 30           ; width
  LDI r2, 6            ; height
  RECTF r7, r11, r3, r2, r14

df_bnext:
  LDI r7, 1
  ADD r15, r7
  LDI r11, 32
  CMP r15, r11
  BLT r6, df_bloop

  ; ── draw paddle ──
  LDI r13, 0x3020
  LOAD r7, r13          ; r7 = paddle_x
  LDI r11, 244           ; y
  LDI r3, 48            ; width
  LDI r2, 6             ; height
  LDI r5, 0xCCCCCC      ; light gray
  RECTF r7, r11, r3, r2, r5

  ; ── draw ball ──
  LDI r13, 0x3021
  LOAD r7, r13          ; ball_x
  LDI r13, 0x3022
  LOAD r11, r13          ; ball_y
  LDI r3, 4            ; width
  LDI r2, 4            ; height
  LDI r5, 0xFFFFFF     ; white
  RECTF r7, r11, r3, r2, r5

  ; ── draw score text ──
  CALL draw_score

  ; ── draw lives (small rects at bottom-right) ──
  LDI r13, 0x3026
  LOAD r14, r13          ; lives
  LDI r5, 0            ; loop counter
  LDI r15, 240         ; x start
df_lloop:
  CMP r5, r14
  BGE r6, df_ldone
  LDI r7, 0
  ADD r7, r15
  LDI r11, 252           ; y
  LDI r3, 4             ; w
  LDI r2, 4             ; h
  LDI r4, 0x00CC44     ; green
  RECTF r7, r11, r3, r2, r4
  LDI r7, 6
  ADD r15, r7           ; next life dot x += 6
  LDI r7, 1
  ADD r5, r7
  JMP df_lloop

df_ldone:
  RET

; ─────────────────────────────────────────────────────────────────
; draw_score -- convert score to 3-digit ASCII and display with TEXT
;   Writes digits to RAM[0x3106..0x3108], null at 0x3109
; ─────────────────────────────────────────────────────────────────
draw_score:
  LDI r13, 0x3025
  LOAD r14, r13          ; r14 = score

  ; hundreds digit: score / 100
  LDI r4, 0
  ADD r4, r14           ; r4 = score copy
  LDI r12, 100
  DIV r4, r12           ; r4 = hundreds
  LDI r7, 48
  ADD r4, r7           ; r4 = '0' + hundreds
  LDI r13, 0x3106
  STORE r13, r4

  ; tens digit: (score - hundreds*100) / 10
  LDI r12, 100
  LDI r11, 0
  ADD r11, r4           ; r11 = ASCII hundreds
  LDI r7, 48
  SUB r11, r7           ; r11 = numeric hundreds
  MUL r11, r12           ; r11 = hundreds * 100
  LDI r4, 0
  ADD r4, r14           ; r4 = score
  SUB r4, r11           ; r4 = remainder (< 100)
  LDI r12, 10
  DIV r4, r12           ; r4 = tens
  LDI r7, 48
  ADD r4, r7           ; r4 = '0' + tens
  LDI r13, 0x3107
  STORE r13, r4

  ; ones digit: remainder - tens*10
  LDI r12, 10
  LDI r11, 0
  ADD r11, r4           ; r11 = ASCII tens
  LDI r7, 48
  SUB r11, r7           ; r11 = numeric tens
  MUL r11, r12           ; r11 = tens * 10
  SUB r4, r11           ; r4 = ones
  LDI r7, 48
  ADD r4, r7           ; r4 = '0' + ones
  LDI r13, 0x3108
  STORE r13, r4

  ; null terminator
  LDI r14, 0
  LDI r13, 0x3109
  STORE r13, r14

  ; TEXT opcode to render "SCORE:XXX"
  LDI r7, 2             ; x
  LDI r11, 0             ; y
  LDI r3, 0x3100        ; string address
  TEXT r7, r11, r3

  RET
