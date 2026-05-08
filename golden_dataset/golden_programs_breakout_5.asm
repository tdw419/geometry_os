; DESCRIPTION: Display a object using color red at the screen.

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
  LDI r7, 83
  STORE r13, r7        ; S
  LDI r13, 0x3101
  LDI r7, 67
  STORE r13, r7        ; C
  LDI r13, 0x3102
  LDI r7, 79
  STORE r13, r7        ; O
  LDI r13, 0x3103
  LDI r7, 82
  STORE r13, r7        ; R
  LDI r13, 0x3104
  LDI r7, 69
  STORE r13, r7        ; E
  LDI r13, 0x3105
  LDI r7, 58
  STORE r13, r7        ; :

  ; init bricks -- row 0=red, row 1=orange, row 2=yellow, row 3=green
  LDI r22, 0xFF0000   ; red
  LDI r23, 0xFF8800   ; orange
  LDI r24, 0xFFDD00   ; yellow
  LDI r25, 0x00CC44   ; green
  LDI r11, 0          ; brick index

ib_loop:
  LDI r4, 0
  ADD r4, r11
  LDI r14, 3
  SHR r4, r14          ; r4 = row (0-3)
  ; default green (row 3)
  LDI r7, 0
  ADD r7, r25
  ; check row 0
  LDI r14, 0
  CMP r4, r14
  JZ r15, ib_r0
  ; check row 1
  LDI r14, 1
  CMP r4, r14
  JZ r15, ib_r1
  ; check row 2
  LDI r14, 2
  CMP r4, r14
  JZ r15, ib_r2
  JMP ib_store        ; row 3 = green (already in r7)

ib_r0:
  LDI r7, 0
  ADD r7, r22         ; red
  JMP ib_store

ib_r1:
  LDI r7, 0
  ADD r7, r23         ; orange
  JMP ib_store

ib_r2:
  LDI r7, 0
  ADD r7, r24         ; yellow

ib_store:
  LDI r13, 0x3000
  ADD r13, r11
  STORE r13, r7
  LDI r4, 1
  ADD r11, r4
  LDI r14, 32
  CMP r11, r14
  BLT r15, ib_loop

  ; init game state
  LDI r7, 104
  LDI r13, 0x3020
  STORE r13, r7        ; paddle_x = 104 (centered)
  LDI r7, 0
  LDI r13, 0x3025
  STORE r13, r7        ; score = 0
  LDI r7, 3
  LDI r13, 0x3026
  STORE r13, r7        ; lives = 3
  LDI r7, 0
  LDI r13, 0x3027
  STORE r13, r7        ; game_over = 0
  LDI r7, 32
  LDI r13, 0x3029
  STORE r13, r7        ; bricks_left = 32

  CALL reset_ball

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r13, 0x3027
  LOAD r7, r13
  JNZ r7, game_over_screen

  ; read keyboard
  IKEY r12

  ; A/a = paddle left
  LDI r14, 65
  CMP r12, r14
  JZ r15, pad_left
  LDI r14, 97
  CMP r12, r14
  JZ r15, pad_left

  ; D/d = paddle right
  LDI r14, 68
  CMP r12, r14
  JZ r15, pad_right
  LDI r14, 100
  CMP r12, r14
  JZ r15, pad_right

  ; W/w/Space = launch ball
  LDI r14, 87
  CMP r12, r14
  JZ r15, do_launch
  LDI r14, 119
  CMP r12, r14
  JZ r15, do_launch
  LDI r14, 32
  CMP r12, r14
  JZ r15, do_launch

  ; R/r = restart
  LDI r14, 82
  CMP r12, r14
  JZ r15, restart
  LDI r14, 114
  CMP r12, r14
  JZ r15, restart

after_input:
  ; if ball not launched, stick to paddle
  LDI r13, 0x3028
  LOAD r7, r13
  JNZ r7, update_ball

  ; ball sits on paddle
  LDI r13, 0x3020
  LOAD r7, r13          ; paddle_x
  LDI r4, 22
  ADD r7, r4           ; center ball on paddle
  LDI r13, 0x3021
  STORE r13, r7         ; ball_x
  LDI r7, 240
  LDI r13, 0x3022
  STORE r13, r7         ; ball_y = 240
  JMP draw_and_loop

update_ball:
  ; move ball x
  LDI r13, 0x3021
  LOAD r7, r13
  LDI r13, 0x3023
  LOAD r3, r13
  ADD r7, r3
  LDI r13, 0x3021
  STORE r13, r7

  ; move ball y
  LDI r13, 0x3022
  LOAD r7, r13
  LDI r13, 0x3024
  LOAD r3, r13
  ADD r7, r3
  LDI r13, 0x3022
  STORE r13, r7

  ; ── left wall bounce ──
  LDI r13, 0x3021
  LOAD r7, r13
  LDI r14, 0
  CMP r7, r14
  BGE r15, chk_rw
  LDI r7, 0
  LDI r13, 0x3021
  STORE r13, r7
  LDI r13, 0x3023
  LOAD r7, r13
  NEG r7
  LDI r13, 0x3023
  STORE r13, r7
  ; wall bounce sound
  LDI r4, 330
  LDI r14, 20
  BEEP r4, r14

chk_rw:
  ; ── right wall bounce ──
  LDI r13, 0x3021
  LOAD r7, r13
  LDI r14, 252          ; 256 - 4 (ball width)
  CMP r7, r14
  BLT r15, chk_tw
  LDI r7, 252
  LDI r13, 0x3021
  STORE r13, r7
  LDI r13, 0x3023
  LOAD r7, r13
  NEG r7
  LDI r13, 0x3023
  STORE r13, r7
  ; wall bounce sound
  LDI r4, 330
  LDI r14, 20
  BEEP r4, r14

chk_tw:
  ; ── top wall bounce ──
  LDI r13, 0x3022
  LOAD r7, r13
  LDI r14, 0
  CMP r7, r14
  BGE r15, chk_bot
  LDI r7, 0
  LDI r13, 0x3022
  STORE r13, r7
  LDI r13, 0x3024
  LOAD r7, r13
  NEG r7
  LDI r13, 0x3024
  STORE r13, r7
  ; wall bounce sound
  LDI r4, 330
  LDI r14, 20
  BEEP r4, r14

chk_bot:
  ; ── ball lost (fell off bottom) ──
  LDI r13, 0x3022
  LOAD r7, r13
  LDI r14, 256
  CMP r7, r14
  BLT r15, chk_brick
  CALL lose_life
  JMP draw_and_loop

chk_brick:
  ; ── brick collision ──
  LDI r13, 0x3022
  LOAD r7, r13          ; ball_y
  ; ball must be in brick area: y >= 8 and y < 40
  LDI r14, 8
  CMP r7, r14
  BLT r15, chk_paddle
  LDI r14, 40
  CMP r7, r14
  BGE r15, chk_paddle

  ; compute brick row = (ball_y - 8) >> 3
  LDI r4, 8
  SUB r7, r4
  LDI r4, 3
  SHR r7, r4           ; r7 = row (0-3)

  ; compute brick col = ball_x >> 5
  LDI r13, 0x3021
  LOAD r3, r13          ; ball_x
  LDI r4, 5
  SHR r3, r4           ; r3 = col (0-7)

  ; bounds check
  LDI r14, 4
  CMP r7, r14
  BGE r15, chk_paddle
  LDI r14, 8
  CMP r3, r14
  BGE r15, chk_paddle

  ; brick index = row * 8 + col
  LDI r1, 0
  ADD r1, r7
  LDI r4, 3
  SHL r1, r4           ; row * 8
  ADD r1, r3           ; + col

  ; check if brick alive
  LDI r13, 0x3000
  ADD r13, r1
  LOAD r7, r13
  JZ r7, chk_paddle   ; dead brick, skip

  ; kill brick
  LDI r7, 0
  STORE r13, r7

  ; decrement bricks_left
  LDI r13, 0x3029
  LOAD r7, r13
  LDI r4, 1
  SUB r7, r4
  LDI r13, 0x3029
  STORE r13, r7

  ; check win
  JNZ r7, brick_bounce
  LDI r7, 1
  LDI r13, 0x3027
  STORE r13, r7         ; game_over = 1 (won!)
  LDI r4, 880
  LDI r14, 200
  BEEP r4, r14
  JMP draw_and_loop

brick_bounce:
  ; reverse ball_dy
  LDI r13, 0x3024
  LOAD r7, r13
  NEG r7
  LDI r13, 0x3024
  STORE r13, r7
  ; score += 10
  LDI r13, 0x3025
  LOAD r7, r13
  LDI r4, 10
  ADD r7, r4
  LDI r13, 0x3025
  STORE r13, r7
  ; brick hit sound
  LDI r4, 660
  LDI r14, 30
  BEEP r4, r14

chk_paddle:
  ; ── paddle collision ──
  ; ball must be at paddle level (y >= 240) and moving down
  LDI r13, 0x3022
  LOAD r7, r13          ; ball_y
  LDI r14, 240
  CMP r7, r14
  BLT r15, draw_and_loop
  ; check ball moving down (dy > 0)
  LDI r13, 0x3024
  LOAD r7, r13
  LDI r14, 0
  CMP r7, r14
  BLT r15, draw_and_loop ; moving up, skip
  ; check x overlap (ball center vs paddle bounds)
  LDI r13, 0x3021
  LOAD r7, r13          ; ball_x
  LDI r13, 0x3020
  LOAD r3, r13          ; paddle_x
  LDI r4, 2
  ADD r7, r4           ; ball center x
  CMP r7, r3
  BLT r15, draw_and_loop ; left of paddle
  LDI r4, 48
  ADD r3, r4           ; paddle right edge
  CMP r7, r3
  BGE r15, draw_and_loop ; right of paddle

  ; paddle hit! reverse dy
  LDI r13, 0x3024
  LOAD r7, r13
  NEG r7
  LDI r13, 0x3024
  STORE r13, r7

  ; set dx from hit position (offset -24..24, clamped to -3..3)
  LDI r13, 0x3021
  LOAD r7, r13          ; ball_x
  LDI r4, 2
  ADD r7, r4           ; ball center x
  LDI r13, 0x3020
  LOAD r3, r13          ; paddle_x
  SUB r7, r3           ; offset (0-48)
  LDI r4, 24
  SUB r7, r4           ; -24..24

  ; clamp to [-3, 3]
  LDI r14, 0xFFFFFFFD   ; -3 unsigned
  CMP r7, r14
  BLT r15, dx_neg
  LDI r14, 3
  CMP r7, r14
  BGE r15, dx_pos
  JMP dx_store

dx_neg:
  LDI r7, 0xFFFFFFFD
  JMP dx_store

dx_pos:
  LDI r7, 3

dx_store:
  ; ensure dx is never 0 (would be boring)
  JNZ r7, dx_ok
  LDI r7, 1
dx_ok:
  LDI r13, 0x3023
  STORE r13, r7
  ; paddle hit sound
  LDI r4, 440
  LDI r14, 20
  BEEP r4, r14

draw_and_loop:
  CALL draw_frame
  FRAME
  JMP game_loop

; ── input handlers ───────────────────────────────────────────────
pad_left:
  LDI r13, 0x3020
  LOAD r7, r13
  LDI r4, 5
  SUB r7, r4
  LDI r14, 0
  CMP r7, r14
  BGE r15, pl_ok
  LDI r7, 0
pl_ok:
  LDI r13, 0x3020
  STORE r13, r7
  JMP after_input

pad_right:
  LDI r13, 0x3020
  LOAD r7, r13
  LDI r4, 5
  ADD r7, r4
  LDI r14, 208           ; 256 - 48
  CMP r7, r14
  BLT r15, pr_ok
  LDI r7, 208
pr_ok:
  LDI r13, 0x3020
  STORE r13, r7
  JMP after_input

do_launch:
  LDI r13, 0x3028
  LOAD r7, r13
  JNZ r7, after_input  ; already launched
  LDI r7, 1
  LDI r13, 0x3028
  STORE r13, r7
  JMP after_input

; ── subroutines ──────────────────────────────────────────────────
reset_ball:
  LDI r7, 0
  LDI r13, 0x3028
  STORE r13, r7         ; ball_launched = 0
  LDI r7, 2
  LDI r13, 0x3023
  STORE r13, r7         ; ball_dx = 2
  LDI r7, 0xFFFFFFFD   ; -3
  LDI r13, 0x3024
  STORE r13, r7         ; ball_dy = -3
  RET

lose_life:
  PUSH r31
  LDI r13, 0x3026
  LOAD r7, r13
  LDI r4, 1
  SUB r7, r4
  LDI r13, 0x3026
  STORE r13, r7
  JNZ r7, ll_reset
  ; game over (lost)
  LDI r7, 2
  LDI r13, 0x3027
  STORE r13, r7
  LDI r4, 110
  LDI r14, 300
  BEEP r4, r14
  POP r31
  RET

ll_reset:
  CALL reset_ball
  POP r31
  RET

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r13, 0x3027
  LOAD r7, r13
  LDI r14, 1
  CMP r7, r14
  JZ r15, win_screen

  ; lose screen (dark red)
  LDI r7, 0x330000
  FILL r7
  FRAME
  IKEY r12
  JZ r12, game_over_screen
  JMP restart

win_screen:
  ; win screen (dark green)
  LDI r7, 0x003300
  FILL r7
  FRAME
  IKEY r12
  JZ r12, win_screen
  JMP restart

; ─────────────────────────────────────────────────────────────────
; draw_frame -- render entire screen
;   Clobbers r7-r9, r11. Preserves r20-r25.
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; dark background
  LDI r7, 0x000811
  FILL r7

  ; ── draw bricks ──
  LDI r11, 0           ; brick index
  LDI r20, 0x3000      ; brick base

df_bloop:
  ; load brick color
  LDI r13, 0
  ADD r13, r20
  ADD r13, r11
  LOAD r7, r13          ; r7 = color (0 = dead)
  JZ r7, df_bnext

  ; compute pixel position
  LDI r4, 0
  ADD r4, r11
  LDI r14, 7
  AND r4, r14           ; r4 = col (0-7)
  LDI r6, 5
  SHL r4, r6           ; r4 = col * 32

  LDI r14, 0
  ADD r14, r11
  LDI r6, 3
  SHR r14, r6           ; r14 = row (0-3)
  LDI r6, 3
  SHL r14, r6           ; r14 = row * 8
  LDI r6, 9
  ADD r14, r6           ; r14 = row * 8 + 9 (1px top gap)

  ; draw brick: RECTF(x+1, y+1, 30, 6, color)
  LDI r12, 1
  ADD r4, r12           ; x + 1
  ADD r14, r12           ; y + 1
  LDI r12, 30           ; width
  LDI r6, 6            ; height
  RECTF r4, r14, r12, r6, r7

df_bnext:
  LDI r4, 1
  ADD r11, r4
  LDI r14, 32
  CMP r11, r14
  BLT r15, df_bloop

  ; ── draw paddle ──
  LDI r13, 0x3020
  LOAD r4, r13          ; r4 = paddle_x
  LDI r14, 244           ; y
  LDI r12, 48            ; width
  LDI r6, 6             ; height
  LDI r9, 0xCCCCCC      ; light gray
  RECTF r4, r14, r12, r6, r9

  ; ── draw ball ──
  LDI r13, 0x3021
  LOAD r4, r13          ; ball_x
  LDI r13, 0x3022
  LOAD r14, r13          ; ball_y
  LDI r12, 4            ; width
  LDI r6, 4            ; height
  LDI r9, 0xFFFFFF     ; white
  RECTF r4, r14, r12, r6, r9

  ; ── draw score text ──
  CALL draw_score

  ; ── draw lives (small rects at bottom-right) ──
  LDI r13, 0x3026
  LOAD r7, r13          ; lives
  LDI r9, 0            ; loop counter
  LDI r11, 240         ; x start
df_lloop:
  CMP r9, r7
  BGE r15, df_ldone
  LDI r4, 0
  ADD r4, r11
  LDI r14, 252           ; y
  LDI r12, 4             ; w
  LDI r6, 4             ; h
  LDI r3, 0x00CC44     ; green
  RECTF r4, r14, r12, r6, r3
  LDI r4, 6
  ADD r11, r4           ; next life dot x += 6
  LDI r4, 1
  ADD r9, r4
  JMP df_lloop

df_ldone:
  RET

; ─────────────────────────────────────────────────────────────────
; draw_score -- convert score to 3-digit ASCII and display with TEXT
;   Writes digits to RAM[0x3106..0x3108], null at 0x3109
; ─────────────────────────────────────────────────────────────────
draw_score:
  LDI r13, 0x3025
  LOAD r7, r13          ; r7 = score

  ; hundreds digit: score / 100
  LDI r3, 0
  ADD r3, r7           ; r3 = score copy
  LDI r1, 100
  DIV r3, r1           ; r3 = hundreds
  LDI r4, 48
  ADD r3, r4           ; r3 = '0' + hundreds
  LDI r13, 0x3106
  STORE r13, r3

  ; tens digit: (score - hundreds*100) / 10
  LDI r1, 100
  LDI r14, 0
  ADD r14, r3           ; r14 = ASCII hundreds
  LDI r4, 48
  SUB r14, r4           ; r14 = numeric hundreds
  MUL r14, r1           ; r14 = hundreds * 100
  LDI r3, 0
  ADD r3, r7           ; r3 = score
  SUB r3, r14           ; r3 = remainder (< 100)
  LDI r1, 10
  DIV r3, r1           ; r3 = tens
  LDI r4, 48
  ADD r3, r4           ; r3 = '0' + tens
  LDI r13, 0x3107
  STORE r13, r3

  ; ones digit: remainder - tens*10
  LDI r1, 10
  LDI r14, 0
  ADD r14, r3           ; r14 = ASCII tens
  LDI r4, 48
  SUB r14, r4           ; r14 = numeric tens
  MUL r14, r1           ; r14 = tens * 10
  SUB r3, r14           ; r3 = ones
  LDI r4, 48
  ADD r3, r4           ; r3 = '0' + ones
  LDI r13, 0x3108
  STORE r13, r3

  ; null terminator
  LDI r7, 0
  LDI r13, 0x3109
  STORE r13, r7

  ; TEXT opcode to render "SCORE:XXX"
  LDI r4, 2             ; x
  LDI r14, 0             ; y
  LDI r12, 0x3100        ; string address
  TEXT r4, r14, r12

  RET
