; DESCRIPTION: Draws a red object at the screen with fixed size.

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
  LDI r14, 0x3100
  LDI r5, 83
  STORE r14, r5        ; S
  LDI r14, 0x3101
  LDI r5, 67
  STORE r14, r5        ; C
  LDI r14, 0x3102
  LDI r5, 79
  STORE r14, r5        ; O
  LDI r14, 0x3103
  LDI r5, 82
  STORE r14, r5        ; R
  LDI r14, 0x3104
  LDI r5, 69
  STORE r14, r5        ; E
  LDI r14, 0x3105
  LDI r5, 58
  STORE r14, r5        ; :

  ; init bricks -- row 0=red, row 1=orange, row 2=yellow, row 3=green
  LDI r22, 0xFF0000   ; red
  LDI r23, 0xFF8800   ; orange
  LDI r24, 0xFFDD00   ; yellow
  LDI r25, 0x00CC44   ; green
  LDI r4, 0          ; brick index

ib_loop:
  LDI r3, 0
  ADD r3, r4
  LDI r1, 3
  SHR r3, r1          ; r3 = row (0-3)
  ; default green (row 3)
  LDI r5, 0
  ADD r5, r25
  ; check row 0
  LDI r1, 0
  CMP r3, r1
  JZ r0, ib_r0
  ; check row 1
  LDI r1, 1
  CMP r3, r1
  JZ r0, ib_r1
  ; check row 2
  LDI r1, 2
  CMP r3, r1
  JZ r0, ib_r2
  JMP ib_store        ; row 3 = green (already in r5)

ib_r0:
  LDI r5, 0
  ADD r5, r22         ; red
  JMP ib_store

ib_r1:
  LDI r5, 0
  ADD r5, r23         ; orange
  JMP ib_store

ib_r2:
  LDI r5, 0
  ADD r5, r24         ; yellow

ib_store:
  LDI r14, 0x3000
  ADD r14, r4
  STORE r14, r5
  LDI r3, 1
  ADD r4, r3
  LDI r1, 32
  CMP r4, r1
  BLT r0, ib_loop

  ; init game state
  LDI r5, 104
  LDI r14, 0x3020
  STORE r14, r5        ; paddle_x = 104 (centered)
  LDI r5, 0
  LDI r14, 0x3025
  STORE r14, r5        ; score = 0
  LDI r5, 3
  LDI r14, 0x3026
  STORE r14, r5        ; lives = 3
  LDI r5, 0
  LDI r14, 0x3027
  STORE r14, r5        ; game_over = 0
  LDI r5, 32
  LDI r14, 0x3029
  STORE r14, r5        ; bricks_left = 32

  CALL reset_ball

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r14, 0x3027
  LOAD r5, r14
  JNZ r5, game_over_screen

  ; read keyboard
  IKEY r6

  ; A/a = paddle left
  LDI r1, 65
  CMP r6, r1
  JZ r0, pad_left
  LDI r1, 97
  CMP r6, r1
  JZ r0, pad_left

  ; D/d = paddle right
  LDI r1, 68
  CMP r6, r1
  JZ r0, pad_right
  LDI r1, 100
  CMP r6, r1
  JZ r0, pad_right

  ; W/w/Space = launch ball
  LDI r1, 87
  CMP r6, r1
  JZ r0, do_launch
  LDI r1, 119
  CMP r6, r1
  JZ r0, do_launch
  LDI r1, 32
  CMP r6, r1
  JZ r0, do_launch

  ; R/r = restart
  LDI r1, 82
  CMP r6, r1
  JZ r0, restart
  LDI r1, 114
  CMP r6, r1
  JZ r0, restart

after_input:
  ; if ball not launched, stick to paddle
  LDI r14, 0x3028
  LOAD r5, r14
  JNZ r5, update_ball

  ; ball sits on paddle
  LDI r14, 0x3020
  LOAD r5, r14          ; paddle_x
  LDI r3, 22
  ADD r5, r3           ; center ball on paddle
  LDI r14, 0x3021
  STORE r14, r5         ; ball_x
  LDI r5, 240
  LDI r14, 0x3022
  STORE r14, r5         ; ball_y = 240
  JMP draw_and_loop

update_ball:
  ; move ball x
  LDI r14, 0x3021
  LOAD r5, r14
  LDI r14, 0x3023
  LOAD r15, r14
  ADD r5, r15
  LDI r14, 0x3021
  STORE r14, r5

  ; move ball y
  LDI r14, 0x3022
  LOAD r5, r14
  LDI r14, 0x3024
  LOAD r15, r14
  ADD r5, r15
  LDI r14, 0x3022
  STORE r14, r5

  ; ── left wall bounce ──
  LDI r14, 0x3021
  LOAD r5, r14
  LDI r1, 0
  CMP r5, r1
  BGE r0, chk_rw
  LDI r5, 0
  LDI r14, 0x3021
  STORE r14, r5
  LDI r14, 0x3023
  LOAD r5, r14
  NEG r5
  LDI r14, 0x3023
  STORE r14, r5
  ; wall bounce sound
  LDI r3, 330
  LDI r1, 20
  BEEP r3, r1

chk_rw:
  ; ── right wall bounce ──
  LDI r14, 0x3021
  LOAD r5, r14
  LDI r1, 252          ; 256 - 4 (ball width)
  CMP r5, r1
  BLT r0, chk_tw
  LDI r5, 252
  LDI r14, 0x3021
  STORE r14, r5
  LDI r14, 0x3023
  LOAD r5, r14
  NEG r5
  LDI r14, 0x3023
  STORE r14, r5
  ; wall bounce sound
  LDI r3, 330
  LDI r1, 20
  BEEP r3, r1

chk_tw:
  ; ── top wall bounce ──
  LDI r14, 0x3022
  LOAD r5, r14
  LDI r1, 0
  CMP r5, r1
  BGE r0, chk_bot
  LDI r5, 0
  LDI r14, 0x3022
  STORE r14, r5
  LDI r14, 0x3024
  LOAD r5, r14
  NEG r5
  LDI r14, 0x3024
  STORE r14, r5
  ; wall bounce sound
  LDI r3, 330
  LDI r1, 20
  BEEP r3, r1

chk_bot:
  ; ── ball lost (fell off bottom) ──
  LDI r14, 0x3022
  LOAD r5, r14
  LDI r1, 256
  CMP r5, r1
  BLT r0, chk_brick
  CALL lose_life
  JMP draw_and_loop

chk_brick:
  ; ── brick collision ──
  LDI r14, 0x3022
  LOAD r5, r14          ; ball_y
  ; ball must be in brick area: y >= 8 and y < 40
  LDI r1, 8
  CMP r5, r1
  BLT r0, chk_paddle
  LDI r1, 40
  CMP r5, r1
  BGE r0, chk_paddle

  ; compute brick row = (ball_y - 8) >> 3
  LDI r3, 8
  SUB r5, r3
  LDI r3, 3
  SHR r5, r3           ; r5 = row (0-3)

  ; compute brick col = ball_x >> 5
  LDI r14, 0x3021
  LOAD r15, r14          ; ball_x
  LDI r3, 5
  SHR r15, r3           ; r15 = col (0-7)

  ; bounds check
  LDI r1, 4
  CMP r5, r1
  BGE r0, chk_paddle
  LDI r1, 8
  CMP r15, r1
  BGE r0, chk_paddle

  ; brick index = row * 8 + col
  LDI r2, 0
  ADD r2, r5
  LDI r3, 3
  SHL r2, r3           ; row * 8
  ADD r2, r15           ; + col

  ; check if brick alive
  LDI r14, 0x3000
  ADD r14, r2
  LOAD r5, r14
  JZ r5, chk_paddle   ; dead brick, skip

  ; kill brick
  LDI r5, 0
  STORE r14, r5

  ; decrement bricks_left
  LDI r14, 0x3029
  LOAD r5, r14
  LDI r3, 1
  SUB r5, r3
  LDI r14, 0x3029
  STORE r14, r5

  ; check win
  JNZ r5, brick_bounce
  LDI r5, 1
  LDI r14, 0x3027
  STORE r14, r5         ; game_over = 1 (won!)
  LDI r3, 880
  LDI r1, 200
  BEEP r3, r1
  JMP draw_and_loop

brick_bounce:
  ; reverse ball_dy
  LDI r14, 0x3024
  LOAD r5, r14
  NEG r5
  LDI r14, 0x3024
  STORE r14, r5
  ; score += 10
  LDI r14, 0x3025
  LOAD r5, r14
  LDI r3, 10
  ADD r5, r3
  LDI r14, 0x3025
  STORE r14, r5
  ; brick hit sound
  LDI r3, 660
  LDI r1, 30
  BEEP r3, r1

chk_paddle:
  ; ── paddle collision ──
  ; ball must be at paddle level (y >= 240) and moving down
  LDI r14, 0x3022
  LOAD r5, r14          ; ball_y
  LDI r1, 240
  CMP r5, r1
  BLT r0, draw_and_loop
  ; check ball moving down (dy > 0)
  LDI r14, 0x3024
  LOAD r5, r14
  LDI r1, 0
  CMP r5, r1
  BLT r0, draw_and_loop ; moving up, skip
  ; check x overlap (ball center vs paddle bounds)
  LDI r14, 0x3021
  LOAD r5, r14          ; ball_x
  LDI r14, 0x3020
  LOAD r15, r14          ; paddle_x
  LDI r3, 2
  ADD r5, r3           ; ball center x
  CMP r5, r15
  BLT r0, draw_and_loop ; left of paddle
  LDI r3, 48
  ADD r15, r3           ; paddle right edge
  CMP r5, r15
  BGE r0, draw_and_loop ; right of paddle

  ; paddle hit! reverse dy
  LDI r14, 0x3024
  LOAD r5, r14
  NEG r5
  LDI r14, 0x3024
  STORE r14, r5

  ; set dx from hit position (offset -24..24, clamped to -3..3)
  LDI r14, 0x3021
  LOAD r5, r14          ; ball_x
  LDI r3, 2
  ADD r5, r3           ; ball center x
  LDI r14, 0x3020
  LOAD r15, r14          ; paddle_x
  SUB r5, r15           ; offset (0-48)
  LDI r3, 24
  SUB r5, r3           ; -24..24

  ; clamp to [-3, 3]
  LDI r1, 0xFFFFFFFD   ; -3 unsigned
  CMP r5, r1
  BLT r0, dx_neg
  LDI r1, 3
  CMP r5, r1
  BGE r0, dx_pos
  JMP dx_store

dx_neg:
  LDI r5, 0xFFFFFFFD
  JMP dx_store

dx_pos:
  LDI r5, 3

dx_store:
  ; ensure dx is never 0 (would be boring)
  JNZ r5, dx_ok
  LDI r5, 1
dx_ok:
  LDI r14, 0x3023
  STORE r14, r5
  ; paddle hit sound
  LDI r3, 440
  LDI r1, 20
  BEEP r3, r1

draw_and_loop:
  CALL draw_frame
  FRAME
  JMP game_loop

; ── input handlers ───────────────────────────────────────────────
pad_left:
  LDI r14, 0x3020
  LOAD r5, r14
  LDI r3, 5
  SUB r5, r3
  LDI r1, 0
  CMP r5, r1
  BGE r0, pl_ok
  LDI r5, 0
pl_ok:
  LDI r14, 0x3020
  STORE r14, r5
  JMP after_input

pad_right:
  LDI r14, 0x3020
  LOAD r5, r14
  LDI r3, 5
  ADD r5, r3
  LDI r1, 208           ; 256 - 48
  CMP r5, r1
  BLT r0, pr_ok
  LDI r5, 208
pr_ok:
  LDI r14, 0x3020
  STORE r14, r5
  JMP after_input

do_launch:
  LDI r14, 0x3028
  LOAD r5, r14
  JNZ r5, after_input  ; already launched
  LDI r5, 1
  LDI r14, 0x3028
  STORE r14, r5
  JMP after_input

; ── subroutines ──────────────────────────────────────────────────
reset_ball:
  LDI r5, 0
  LDI r14, 0x3028
  STORE r14, r5         ; ball_launched = 0
  LDI r5, 2
  LDI r14, 0x3023
  STORE r14, r5         ; ball_dx = 2
  LDI r5, 0xFFFFFFFD   ; -3
  LDI r14, 0x3024
  STORE r14, r5         ; ball_dy = -3
  RET

lose_life:
  PUSH r31
  LDI r14, 0x3026
  LOAD r5, r14
  LDI r3, 1
  SUB r5, r3
  LDI r14, 0x3026
  STORE r14, r5
  JNZ r5, ll_reset
  ; game over (lost)
  LDI r5, 2
  LDI r14, 0x3027
  STORE r14, r5
  LDI r3, 110
  LDI r1, 300
  BEEP r3, r1
  POP r31
  RET

ll_reset:
  CALL reset_ball
  POP r31
  RET

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r14, 0x3027
  LOAD r5, r14
  LDI r1, 1
  CMP r5, r1
  JZ r0, win_screen

  ; lose screen (dark red)
  LDI r5, 0x330000
  FILL r5
  FRAME
  IKEY r6
  JZ r6, game_over_screen
  JMP restart

win_screen:
  ; win screen (dark green)
  LDI r5, 0x003300
  FILL r5
  FRAME
  IKEY r6
  JZ r6, win_screen
  JMP restart

; ─────────────────────────────────────────────────────────────────
; draw_frame -- render entire screen
;   Clobbers r5-r8, r4. Preserves r20-r25.
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; dark background
  LDI r5, 0x000811
  FILL r5

  ; ── draw bricks ──
  LDI r4, 0           ; brick index
  LDI r20, 0x3000      ; brick base

df_bloop:
  ; load brick color
  LDI r14, 0
  ADD r14, r20
  ADD r14, r4
  LOAD r5, r14          ; r5 = color (0 = dead)
  JZ r5, df_bnext

  ; compute pixel position
  LDI r3, 0
  ADD r3, r4
  LDI r1, 7
  AND r3, r1           ; r3 = col (0-7)
  LDI r7, 5
  SHL r3, r7           ; r3 = col * 32

  LDI r1, 0
  ADD r1, r4
  LDI r7, 3
  SHR r1, r7           ; r1 = row (0-3)
  LDI r7, 3
  SHL r1, r7           ; r1 = row * 8
  LDI r7, 9
  ADD r1, r7           ; r1 = row * 8 + 9 (1px top gap)

  ; draw brick: RECTF(x+1, y+1, 30, 6, color)
  LDI r6, 1
  ADD r3, r6           ; x + 1
  ADD r1, r6           ; y + 1
  LDI r6, 30           ; width
  LDI r7, 6            ; height
  RECTF r3, r1, r6, r7, r5

df_bnext:
  LDI r3, 1
  ADD r4, r3
  LDI r1, 32
  CMP r4, r1
  BLT r0, df_bloop

  ; ── draw paddle ──
  LDI r14, 0x3020
  LOAD r3, r14          ; r3 = paddle_x
  LDI r1, 244           ; y
  LDI r6, 48            ; width
  LDI r7, 6             ; height
  LDI r8, 0xCCCCCC      ; light gray
  RECTF r3, r1, r6, r7, r8

  ; ── draw ball ──
  LDI r14, 0x3021
  LOAD r3, r14          ; ball_x
  LDI r14, 0x3022
  LOAD r1, r14          ; ball_y
  LDI r6, 4            ; width
  LDI r7, 4            ; height
  LDI r8, 0xFFFFFF     ; white
  RECTF r3, r1, r6, r7, r8

  ; ── draw score text ──
  CALL draw_score

  ; ── draw lives (small rects at bottom-right) ──
  LDI r14, 0x3026
  LOAD r5, r14          ; lives
  LDI r8, 0            ; loop counter
  LDI r4, 240         ; x start
df_lloop:
  CMP r8, r5
  BGE r0, df_ldone
  LDI r3, 0
  ADD r3, r4
  LDI r1, 252           ; y
  LDI r6, 4             ; w
  LDI r7, 4             ; h
  LDI r15, 0x00CC44     ; green
  RECTF r3, r1, r6, r7, r15
  LDI r3, 6
  ADD r4, r3           ; next life dot x += 6
  LDI r3, 1
  ADD r8, r3
  JMP df_lloop

df_ldone:
  RET

; ─────────────────────────────────────────────────────────────────
; draw_score -- convert score to 3-digit ASCII and display with TEXT
;   Writes digits to RAM[0x3106..0x3108], null at 0x3109
; ─────────────────────────────────────────────────────────────────
draw_score:
  LDI r14, 0x3025
  LOAD r5, r14          ; r5 = score

  ; hundreds digit: score / 100
  LDI r15, 0
  ADD r15, r5           ; r15 = score copy
  LDI r2, 100
  DIV r15, r2           ; r15 = hundreds
  LDI r3, 48
  ADD r15, r3           ; r15 = '0' + hundreds
  LDI r14, 0x3106
  STORE r14, r15

  ; tens digit: (score - hundreds*100) / 10
  LDI r2, 100
  LDI r1, 0
  ADD r1, r15           ; r1 = ASCII hundreds
  LDI r3, 48
  SUB r1, r3           ; r1 = numeric hundreds
  MUL r1, r2           ; r1 = hundreds * 100
  LDI r15, 0
  ADD r15, r5           ; r15 = score
  SUB r15, r1           ; r15 = remainder (< 100)
  LDI r2, 10
  DIV r15, r2           ; r15 = tens
  LDI r3, 48
  ADD r15, r3           ; r15 = '0' + tens
  LDI r14, 0x3107
  STORE r14, r15

  ; ones digit: remainder - tens*10
  LDI r2, 10
  LDI r1, 0
  ADD r1, r15           ; r1 = ASCII tens
  LDI r3, 48
  SUB r1, r3           ; r1 = numeric tens
  MUL r1, r2           ; r1 = tens * 10
  SUB r15, r1           ; r15 = ones
  LDI r3, 48
  ADD r15, r3           ; r15 = '0' + ones
  LDI r14, 0x3108
  STORE r14, r15

  ; null terminator
  LDI r5, 0
  LDI r14, 0x3109
  STORE r14, r5

  ; TEXT opcode to render "SCORE:XXX"
  LDI r3, 2             ; x
  LDI r1, 0             ; y
  LDI r6, 0x3100        ; string address
  TEXT r3, r1, r6

  RET
