; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

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
  LDI r10, 0x3100
  LDI r15, 83
  STORE r10, r15        ; S
  LDI r10, 0x3101
  LDI r15, 67
  STORE r10, r15        ; C
  LDI r10, 0x3102
  LDI r15, 79
  STORE r10, r15        ; O
  LDI r10, 0x3103
  LDI r15, 82
  STORE r10, r15        ; R
  LDI r10, 0x3104
  LDI r15, 69
  STORE r10, r15        ; E
  LDI r10, 0x3105
  LDI r15, 58
  STORE r10, r15        ; :

  ; init bricks -- row 0=red, row 1=orange, row 2=yellow, row 3=green
  LDI r22, 0xFF0000   ; red
  LDI r23, 0xFF8800   ; orange
  LDI r24, 0xFFDD00   ; yellow
  LDI r25, 0x00CC44   ; green
  LDI r4, 0          ; brick index

ib_loop:
  LDI r3, 0
  ADD r3, r4
  LDI r9, 3
  SHR r3, r9          ; r3 = row (0-3)
  ; default green (row 3)
  LDI r15, 0
  ADD r15, r25
  ; check row 0
  LDI r9, 0
  CMP r3, r9
  JZ r1, ib_r0
  ; check row 1
  LDI r9, 1
  CMP r3, r9
  JZ r1, ib_r1
  ; check row 2
  LDI r9, 2
  CMP r3, r9
  JZ r1, ib_r2
  JMP ib_store        ; row 3 = green (already in r15)

ib_r0:
  LDI r15, 0
  ADD r15, r22         ; red
  JMP ib_store

ib_r1:
  LDI r15, 0
  ADD r15, r23         ; orange
  JMP ib_store

ib_r2:
  LDI r15, 0
  ADD r15, r24         ; yellow

ib_store:
  LDI r10, 0x3000
  ADD r10, r4
  STORE r10, r15
  LDI r3, 1
  ADD r4, r3
  LDI r9, 32
  CMP r4, r9
  BLT r1, ib_loop

  ; init game state
  LDI r15, 104
  LDI r10, 0x3020
  STORE r10, r15        ; paddle_x = 104 (centered)
  LDI r15, 0
  LDI r10, 0x3025
  STORE r10, r15        ; score = 0
  LDI r15, 3
  LDI r10, 0x3026
  STORE r10, r15        ; lives = 3
  LDI r15, 0
  LDI r10, 0x3027
  STORE r10, r15        ; game_over = 0
  LDI r15, 32
  LDI r10, 0x3029
  STORE r10, r15        ; bricks_left = 32

  CALL reset_ball

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r10, 0x3027
  LOAD r15, r10
  JNZ r15, game_over_screen

  ; read keyboard
  IKEY r2

  ; A/a = paddle left
  LDI r9, 65
  CMP r2, r9
  JZ r1, pad_left
  LDI r9, 97
  CMP r2, r9
  JZ r1, pad_left

  ; D/d = paddle right
  LDI r9, 68
  CMP r2, r9
  JZ r1, pad_right
  LDI r9, 100
  CMP r2, r9
  JZ r1, pad_right

  ; W/w/Space = launch ball
  LDI r9, 87
  CMP r2, r9
  JZ r1, do_launch
  LDI r9, 119
  CMP r2, r9
  JZ r1, do_launch
  LDI r9, 32
  CMP r2, r9
  JZ r1, do_launch

  ; R/r = restart
  LDI r9, 82
  CMP r2, r9
  JZ r1, restart
  LDI r9, 114
  CMP r2, r9
  JZ r1, restart

after_input:
  ; if ball not launched, stick to paddle
  LDI r10, 0x3028
  LOAD r15, r10
  JNZ r15, update_ball

  ; ball sits on paddle
  LDI r10, 0x3020
  LOAD r15, r10          ; paddle_x
  LDI r3, 22
  ADD r15, r3           ; center ball on paddle
  LDI r10, 0x3021
  STORE r10, r15         ; ball_x
  LDI r15, 240
  LDI r10, 0x3022
  STORE r10, r15         ; ball_y = 240
  JMP draw_and_loop

update_ball:
  ; move ball x
  LDI r10, 0x3021
  LOAD r15, r10
  LDI r10, 0x3023
  LOAD r13, r10
  ADD r15, r13
  LDI r10, 0x3021
  STORE r10, r15

  ; move ball y
  LDI r10, 0x3022
  LOAD r15, r10
  LDI r10, 0x3024
  LOAD r13, r10
  ADD r15, r13
  LDI r10, 0x3022
  STORE r10, r15

  ; ── left wall bounce ──
  LDI r10, 0x3021
  LOAD r15, r10
  LDI r9, 0
  CMP r15, r9
  BGE r1, chk_rw
  LDI r15, 0
  LDI r10, 0x3021
  STORE r10, r15
  LDI r10, 0x3023
  LOAD r15, r10
  NEG r15
  LDI r10, 0x3023
  STORE r10, r15
  ; wall bounce sound
  LDI r3, 330
  LDI r9, 20
  BEEP r3, r9

chk_rw:
  ; ── right wall bounce ──
  LDI r10, 0x3021
  LOAD r15, r10
  LDI r9, 252          ; 256 - 4 (ball width)
  CMP r15, r9
  BLT r1, chk_tw
  LDI r15, 252
  LDI r10, 0x3021
  STORE r10, r15
  LDI r10, 0x3023
  LOAD r15, r10
  NEG r15
  LDI r10, 0x3023
  STORE r10, r15
  ; wall bounce sound
  LDI r3, 330
  LDI r9, 20
  BEEP r3, r9

chk_tw:
  ; ── top wall bounce ──
  LDI r10, 0x3022
  LOAD r15, r10
  LDI r9, 0
  CMP r15, r9
  BGE r1, chk_bot
  LDI r15, 0
  LDI r10, 0x3022
  STORE r10, r15
  LDI r10, 0x3024
  LOAD r15, r10
  NEG r15
  LDI r10, 0x3024
  STORE r10, r15
  ; wall bounce sound
  LDI r3, 330
  LDI r9, 20
  BEEP r3, r9

chk_bot:
  ; ── ball lost (fell off bottom) ──
  LDI r10, 0x3022
  LOAD r15, r10
  LDI r9, 256
  CMP r15, r9
  BLT r1, chk_brick
  CALL lose_life
  JMP draw_and_loop

chk_brick:
  ; ── brick collision ──
  LDI r10, 0x3022
  LOAD r15, r10          ; ball_y
  ; ball must be in brick area: y >= 8 and y < 40
  LDI r9, 8
  CMP r15, r9
  BLT r1, chk_paddle
  LDI r9, 40
  CMP r15, r9
  BGE r1, chk_paddle

  ; compute brick row = (ball_y - 8) >> 3
  LDI r3, 8
  SUB r15, r3
  LDI r3, 3
  SHR r15, r3           ; r15 = row (0-3)

  ; compute brick col = ball_x >> 5
  LDI r10, 0x3021
  LOAD r13, r10          ; ball_x
  LDI r3, 5
  SHR r13, r3           ; r13 = col (0-7)

  ; bounds check
  LDI r9, 4
  CMP r15, r9
  BGE r1, chk_paddle
  LDI r9, 8
  CMP r13, r9
  BGE r1, chk_paddle

  ; brick index = row * 8 + col
  LDI r6, 0
  ADD r6, r15
  LDI r3, 3
  SHL r6, r3           ; row * 8
  ADD r6, r13           ; + col

  ; check if brick alive
  LDI r10, 0x3000
  ADD r10, r6
  LOAD r15, r10
  JZ r15, chk_paddle   ; dead brick, skip

  ; kill brick
  LDI r15, 0
  STORE r10, r15

  ; decrement bricks_left
  LDI r10, 0x3029
  LOAD r15, r10
  LDI r3, 1
  SUB r15, r3
  LDI r10, 0x3029
  STORE r10, r15

  ; check win
  JNZ r15, brick_bounce
  LDI r15, 1
  LDI r10, 0x3027
  STORE r10, r15         ; game_over = 1 (won!)
  LDI r3, 880
  LDI r9, 200
  BEEP r3, r9
  JMP draw_and_loop

brick_bounce:
  ; reverse ball_dy
  LDI r10, 0x3024
  LOAD r15, r10
  NEG r15
  LDI r10, 0x3024
  STORE r10, r15
  ; score += 10
  LDI r10, 0x3025
  LOAD r15, r10
  LDI r3, 10
  ADD r15, r3
  LDI r10, 0x3025
  STORE r10, r15
  ; brick hit sound
  LDI r3, 660
  LDI r9, 30
  BEEP r3, r9

chk_paddle:
  ; ── paddle collision ──
  ; ball must be at paddle level (y >= 240) and moving down
  LDI r10, 0x3022
  LOAD r15, r10          ; ball_y
  LDI r9, 240
  CMP r15, r9
  BLT r1, draw_and_loop
  ; check ball moving down (dy > 0)
  LDI r10, 0x3024
  LOAD r15, r10
  LDI r9, 0
  CMP r15, r9
  BLT r1, draw_and_loop ; moving up, skip
  ; check x overlap (ball center vs paddle bounds)
  LDI r10, 0x3021
  LOAD r15, r10          ; ball_x
  LDI r10, 0x3020
  LOAD r13, r10          ; paddle_x
  LDI r3, 2
  ADD r15, r3           ; ball center x
  CMP r15, r13
  BLT r1, draw_and_loop ; left of paddle
  LDI r3, 48
  ADD r13, r3           ; paddle right edge
  CMP r15, r13
  BGE r1, draw_and_loop ; right of paddle

  ; paddle hit! reverse dy
  LDI r10, 0x3024
  LOAD r15, r10
  NEG r15
  LDI r10, 0x3024
  STORE r10, r15

  ; set dx from hit position (offset -24..24, clamped to -3..3)
  LDI r10, 0x3021
  LOAD r15, r10          ; ball_x
  LDI r3, 2
  ADD r15, r3           ; ball center x
  LDI r10, 0x3020
  LOAD r13, r10          ; paddle_x
  SUB r15, r13           ; offset (0-48)
  LDI r3, 24
  SUB r15, r3           ; -24..24

  ; clamp to [-3, 3]
  LDI r9, 0xFFFFFFFD   ; -3 unsigned
  CMP r15, r9
  BLT r1, dx_neg
  LDI r9, 3
  CMP r15, r9
  BGE r1, dx_pos
  JMP dx_store

dx_neg:
  LDI r15, 0xFFFFFFFD
  JMP dx_store

dx_pos:
  LDI r15, 3

dx_store:
  ; ensure dx is never 0 (would be boring)
  JNZ r15, dx_ok
  LDI r15, 1
dx_ok:
  LDI r10, 0x3023
  STORE r10, r15
  ; paddle hit sound
  LDI r3, 440
  LDI r9, 20
  BEEP r3, r9

draw_and_loop:
  CALL draw_frame
  FRAME
  JMP game_loop

; ── input handlers ───────────────────────────────────────────────
pad_left:
  LDI r10, 0x3020
  LOAD r15, r10
  LDI r3, 5
  SUB r15, r3
  LDI r9, 0
  CMP r15, r9
  BGE r1, pl_ok
  LDI r15, 0
pl_ok:
  LDI r10, 0x3020
  STORE r10, r15
  JMP after_input

pad_right:
  LDI r10, 0x3020
  LOAD r15, r10
  LDI r3, 5
  ADD r15, r3
  LDI r9, 208           ; 256 - 48
  CMP r15, r9
  BLT r1, pr_ok
  LDI r15, 208
pr_ok:
  LDI r10, 0x3020
  STORE r10, r15
  JMP after_input

do_launch:
  LDI r10, 0x3028
  LOAD r15, r10
  JNZ r15, after_input  ; already launched
  LDI r15, 1
  LDI r10, 0x3028
  STORE r10, r15
  JMP after_input

; ── subroutines ──────────────────────────────────────────────────
reset_ball:
  LDI r15, 0
  LDI r10, 0x3028
  STORE r10, r15         ; ball_launched = 0
  LDI r15, 2
  LDI r10, 0x3023
  STORE r10, r15         ; ball_dx = 2
  LDI r15, 0xFFFFFFFD   ; -3
  LDI r10, 0x3024
  STORE r10, r15         ; ball_dy = -3
  RET

lose_life:
  PUSH r31
  LDI r10, 0x3026
  LOAD r15, r10
  LDI r3, 1
  SUB r15, r3
  LDI r10, 0x3026
  STORE r10, r15
  JNZ r15, ll_reset
  ; game over (lost)
  LDI r15, 2
  LDI r10, 0x3027
  STORE r10, r15
  LDI r3, 110
  LDI r9, 300
  BEEP r3, r9
  POP r31
  RET

ll_reset:
  CALL reset_ball
  POP r31
  RET

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r10, 0x3027
  LOAD r15, r10
  LDI r9, 1
  CMP r15, r9
  JZ r1, win_screen

  ; lose screen (dark red)
  LDI r15, 0x330000
  FILL r15
  FRAME
  IKEY r2
  JZ r2, game_over_screen
  JMP restart

win_screen:
  ; win screen (dark green)
  LDI r15, 0x003300
  FILL r15
  FRAME
  IKEY r2
  JZ r2, win_screen
  JMP restart

; ─────────────────────────────────────────────────────────────────
; draw_frame -- render entire screen
;   Clobbers r15-r11, r4. Preserves r20-r25.
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; dark background
  LDI r15, 0x000811
  FILL r15

  ; ── draw bricks ──
  LDI r4, 0           ; brick index
  LDI r20, 0x3000      ; brick base

df_bloop:
  ; load brick color
  LDI r10, 0
  ADD r10, r20
  ADD r10, r4
  LOAD r15, r10          ; r15 = color (0 = dead)
  JZ r15, df_bnext

  ; compute pixel position
  LDI r3, 0
  ADD r3, r4
  LDI r9, 7
  AND r3, r9           ; r3 = col (0-7)
  LDI r14, 5
  SHL r3, r14           ; r3 = col * 32

  LDI r9, 0
  ADD r9, r4
  LDI r14, 3
  SHR r9, r14           ; r9 = row (0-3)
  LDI r14, 3
  SHL r9, r14           ; r9 = row * 8
  LDI r14, 9
  ADD r9, r14           ; r9 = row * 8 + 9 (1px top gap)

  ; draw brick: RECTF(x+1, y+1, 30, 6, color)
  LDI r2, 1
  ADD r3, r2           ; x + 1
  ADD r9, r2           ; y + 1
  LDI r2, 30           ; width
  LDI r14, 6            ; height
  RECTF r3, r9, r2, r14, r15

df_bnext:
  LDI r3, 1
  ADD r4, r3
  LDI r9, 32
  CMP r4, r9
  BLT r1, df_bloop

  ; ── draw paddle ──
  LDI r10, 0x3020
  LOAD r3, r10          ; r3 = paddle_x
  LDI r9, 244           ; y
  LDI r2, 48            ; width
  LDI r14, 6             ; height
  LDI r11, 0xCCCCCC      ; light gray
  RECTF r3, r9, r2, r14, r11

  ; ── draw ball ──
  LDI r10, 0x3021
  LOAD r3, r10          ; ball_x
  LDI r10, 0x3022
  LOAD r9, r10          ; ball_y
  LDI r2, 4            ; width
  LDI r14, 4            ; height
  LDI r11, 0xFFFFFF     ; white
  RECTF r3, r9, r2, r14, r11

  ; ── draw score text ──
  CALL draw_score

  ; ── draw lives (small rects at bottom-right) ──
  LDI r10, 0x3026
  LOAD r15, r10          ; lives
  LDI r11, 0            ; loop counter
  LDI r4, 240         ; x start
df_lloop:
  CMP r11, r15
  BGE r1, df_ldone
  LDI r3, 0
  ADD r3, r4
  LDI r9, 252           ; y
  LDI r2, 4             ; w
  LDI r14, 4             ; h
  LDI r13, 0x00CC44     ; green
  RECTF r3, r9, r2, r14, r13
  LDI r3, 6
  ADD r4, r3           ; next life dot x += 6
  LDI r3, 1
  ADD r11, r3
  JMP df_lloop

df_ldone:
  RET

; ─────────────────────────────────────────────────────────────────
; draw_score -- convert score to 3-digit ASCII and display with TEXT
;   Writes digits to RAM[0x3106..0x3108], null at 0x3109
; ─────────────────────────────────────────────────────────────────
draw_score:
  LDI r10, 0x3025
  LOAD r15, r10          ; r15 = score

  ; hundreds digit: score / 100
  LDI r13, 0
  ADD r13, r15           ; r13 = score copy
  LDI r6, 100
  DIV r13, r6           ; r13 = hundreds
  LDI r3, 48
  ADD r13, r3           ; r13 = '0' + hundreds
  LDI r10, 0x3106
  STORE r10, r13

  ; tens digit: (score - hundreds*100) / 10
  LDI r6, 100
  LDI r9, 0
  ADD r9, r13           ; r9 = ASCII hundreds
  LDI r3, 48
  SUB r9, r3           ; r9 = numeric hundreds
  MUL r9, r6           ; r9 = hundreds * 100
  LDI r13, 0
  ADD r13, r15           ; r13 = score
  SUB r13, r9           ; r13 = remainder (< 100)
  LDI r6, 10
  DIV r13, r6           ; r13 = tens
  LDI r3, 48
  ADD r13, r3           ; r13 = '0' + tens
  LDI r10, 0x3107
  STORE r10, r13

  ; ones digit: remainder - tens*10
  LDI r6, 10
  LDI r9, 0
  ADD r9, r13           ; r9 = ASCII tens
  LDI r3, 48
  SUB r9, r3           ; r9 = numeric tens
  MUL r9, r6           ; r9 = tens * 10
  SUB r13, r9           ; r13 = ones
  LDI r3, 48
  ADD r13, r3           ; r13 = '0' + ones
  LDI r10, 0x3108
  STORE r10, r13

  ; null terminator
  LDI r15, 0
  LDI r10, 0x3109
  STORE r10, r15

  ; TEXT opcode to render "SCORE:XXX"
  LDI r3, 2             ; x
  LDI r9, 0             ; y
  LDI r2, 0x3100        ; string address
  TEXT r3, r9, r2

  RET
