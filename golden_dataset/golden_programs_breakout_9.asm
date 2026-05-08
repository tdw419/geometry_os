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
  LDI r5, 0x3100
  LDI r7, 83
  STORE r5, r7        ; S
  LDI r5, 0x3101
  LDI r7, 67
  STORE r5, r7        ; C
  LDI r5, 0x3102
  LDI r7, 79
  STORE r5, r7        ; O
  LDI r5, 0x3103
  LDI r7, 82
  STORE r5, r7        ; R
  LDI r5, 0x3104
  LDI r7, 69
  STORE r5, r7        ; E
  LDI r5, 0x3105
  LDI r7, 58
  STORE r5, r7        ; :

  ; init bricks -- row 0=red, row 1=orange, row 2=yellow, row 3=green
  LDI r22, 0xFF0000   ; red
  LDI r23, 0xFF8800   ; orange
  LDI r24, 0xFFDD00   ; yellow
  LDI r25, 0x00CC44   ; green
  LDI r3, 0          ; brick index

ib_loop:
  LDI r13, 0
  ADD r13, r3
  LDI r15, 3
  SHR r13, r15          ; r13 = row (0-3)
  ; default green (row 3)
  LDI r7, 0
  ADD r7, r25
  ; check row 0
  LDI r15, 0
  CMP r13, r15
  JZ r10, ib_r0
  ; check row 1
  LDI r15, 1
  CMP r13, r15
  JZ r10, ib_r1
  ; check row 2
  LDI r15, 2
  CMP r13, r15
  JZ r10, ib_r2
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
  LDI r5, 0x3000
  ADD r5, r3
  STORE r5, r7
  LDI r13, 1
  ADD r3, r13
  LDI r15, 32
  CMP r3, r15
  BLT r10, ib_loop

  ; init game state
  LDI r7, 104
  LDI r5, 0x3020
  STORE r5, r7        ; paddle_x = 104 (centered)
  LDI r7, 0
  LDI r5, 0x3025
  STORE r5, r7        ; score = 0
  LDI r7, 3
  LDI r5, 0x3026
  STORE r5, r7        ; lives = 3
  LDI r7, 0
  LDI r5, 0x3027
  STORE r5, r7        ; game_over = 0
  LDI r7, 32
  LDI r5, 0x3029
  STORE r5, r7        ; bricks_left = 32

  CALL reset_ball

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r5, 0x3027
  LOAD r7, r5
  JNZ r7, game_over_screen

  ; read keyboard
  IKEY r9

  ; A/a = paddle left
  LDI r15, 65
  CMP r9, r15
  JZ r10, pad_left
  LDI r15, 97
  CMP r9, r15
  JZ r10, pad_left

  ; D/d = paddle right
  LDI r15, 68
  CMP r9, r15
  JZ r10, pad_right
  LDI r15, 100
  CMP r9, r15
  JZ r10, pad_right

  ; W/w/Space = launch ball
  LDI r15, 87
  CMP r9, r15
  JZ r10, do_launch
  LDI r15, 119
  CMP r9, r15
  JZ r10, do_launch
  LDI r15, 32
  CMP r9, r15
  JZ r10, do_launch

  ; R/r = restart
  LDI r15, 82
  CMP r9, r15
  JZ r10, restart
  LDI r15, 114
  CMP r9, r15
  JZ r10, restart

after_input:
  ; if ball not launched, stick to paddle
  LDI r5, 0x3028
  LOAD r7, r5
  JNZ r7, update_ball

  ; ball sits on paddle
  LDI r5, 0x3020
  LOAD r7, r5          ; paddle_x
  LDI r13, 22
  ADD r7, r13           ; center ball on paddle
  LDI r5, 0x3021
  STORE r5, r7         ; ball_x
  LDI r7, 240
  LDI r5, 0x3022
  STORE r5, r7         ; ball_y = 240
  JMP draw_and_loop

update_ball:
  ; move ball x
  LDI r5, 0x3021
  LOAD r7, r5
  LDI r5, 0x3023
  LOAD r2, r5
  ADD r7, r2
  LDI r5, 0x3021
  STORE r5, r7

  ; move ball y
  LDI r5, 0x3022
  LOAD r7, r5
  LDI r5, 0x3024
  LOAD r2, r5
  ADD r7, r2
  LDI r5, 0x3022
  STORE r5, r7

  ; ── left wall bounce ──
  LDI r5, 0x3021
  LOAD r7, r5
  LDI r15, 0
  CMP r7, r15
  BGE r10, chk_rw
  LDI r7, 0
  LDI r5, 0x3021
  STORE r5, r7
  LDI r5, 0x3023
  LOAD r7, r5
  NEG r7
  LDI r5, 0x3023
  STORE r5, r7
  ; wall bounce sound
  LDI r13, 330
  LDI r15, 20
  BEEP r13, r15

chk_rw:
  ; ── right wall bounce ──
  LDI r5, 0x3021
  LOAD r7, r5
  LDI r15, 252          ; 256 - 4 (ball width)
  CMP r7, r15
  BLT r10, chk_tw
  LDI r7, 252
  LDI r5, 0x3021
  STORE r5, r7
  LDI r5, 0x3023
  LOAD r7, r5
  NEG r7
  LDI r5, 0x3023
  STORE r5, r7
  ; wall bounce sound
  LDI r13, 330
  LDI r15, 20
  BEEP r13, r15

chk_tw:
  ; ── top wall bounce ──
  LDI r5, 0x3022
  LOAD r7, r5
  LDI r15, 0
  CMP r7, r15
  BGE r10, chk_bot
  LDI r7, 0
  LDI r5, 0x3022
  STORE r5, r7
  LDI r5, 0x3024
  LOAD r7, r5
  NEG r7
  LDI r5, 0x3024
  STORE r5, r7
  ; wall bounce sound
  LDI r13, 330
  LDI r15, 20
  BEEP r13, r15

chk_bot:
  ; ── ball lost (fell off bottom) ──
  LDI r5, 0x3022
  LOAD r7, r5
  LDI r15, 256
  CMP r7, r15
  BLT r10, chk_brick
  CALL lose_life
  JMP draw_and_loop

chk_brick:
  ; ── brick collision ──
  LDI r5, 0x3022
  LOAD r7, r5          ; ball_y
  ; ball must be in brick area: y >= 8 and y < 40
  LDI r15, 8
  CMP r7, r15
  BLT r10, chk_paddle
  LDI r15, 40
  CMP r7, r15
  BGE r10, chk_paddle

  ; compute brick row = (ball_y - 8) >> 3
  LDI r13, 8
  SUB r7, r13
  LDI r13, 3
  SHR r7, r13           ; r7 = row (0-3)

  ; compute brick col = ball_x >> 5
  LDI r5, 0x3021
  LOAD r2, r5          ; ball_x
  LDI r13, 5
  SHR r2, r13           ; r2 = col (0-7)

  ; bounds check
  LDI r15, 4
  CMP r7, r15
  BGE r10, chk_paddle
  LDI r15, 8
  CMP r2, r15
  BGE r10, chk_paddle

  ; brick index = row * 8 + col
  LDI r8, 0
  ADD r8, r7
  LDI r13, 3
  SHL r8, r13           ; row * 8
  ADD r8, r2           ; + col

  ; check if brick alive
  LDI r5, 0x3000
  ADD r5, r8
  LOAD r7, r5
  JZ r7, chk_paddle   ; dead brick, skip

  ; kill brick
  LDI r7, 0
  STORE r5, r7

  ; decrement bricks_left
  LDI r5, 0x3029
  LOAD r7, r5
  LDI r13, 1
  SUB r7, r13
  LDI r5, 0x3029
  STORE r5, r7

  ; check win
  JNZ r7, brick_bounce
  LDI r7, 1
  LDI r5, 0x3027
  STORE r5, r7         ; game_over = 1 (won!)
  LDI r13, 880
  LDI r15, 200
  BEEP r13, r15
  JMP draw_and_loop

brick_bounce:
  ; reverse ball_dy
  LDI r5, 0x3024
  LOAD r7, r5
  NEG r7
  LDI r5, 0x3024
  STORE r5, r7
  ; score += 10
  LDI r5, 0x3025
  LOAD r7, r5
  LDI r13, 10
  ADD r7, r13
  LDI r5, 0x3025
  STORE r5, r7
  ; brick hit sound
  LDI r13, 660
  LDI r15, 30
  BEEP r13, r15

chk_paddle:
  ; ── paddle collision ──
  ; ball must be at paddle level (y >= 240) and moving down
  LDI r5, 0x3022
  LOAD r7, r5          ; ball_y
  LDI r15, 240
  CMP r7, r15
  BLT r10, draw_and_loop
  ; check ball moving down (dy > 0)
  LDI r5, 0x3024
  LOAD r7, r5
  LDI r15, 0
  CMP r7, r15
  BLT r10, draw_and_loop ; moving up, skip
  ; check x overlap (ball center vs paddle bounds)
  LDI r5, 0x3021
  LOAD r7, r5          ; ball_x
  LDI r5, 0x3020
  LOAD r2, r5          ; paddle_x
  LDI r13, 2
  ADD r7, r13           ; ball center x
  CMP r7, r2
  BLT r10, draw_and_loop ; left of paddle
  LDI r13, 48
  ADD r2, r13           ; paddle right edge
  CMP r7, r2
  BGE r10, draw_and_loop ; right of paddle

  ; paddle hit! reverse dy
  LDI r5, 0x3024
  LOAD r7, r5
  NEG r7
  LDI r5, 0x3024
  STORE r5, r7

  ; set dx from hit position (offset -24..24, clamped to -3..3)
  LDI r5, 0x3021
  LOAD r7, r5          ; ball_x
  LDI r13, 2
  ADD r7, r13           ; ball center x
  LDI r5, 0x3020
  LOAD r2, r5          ; paddle_x
  SUB r7, r2           ; offset (0-48)
  LDI r13, 24
  SUB r7, r13           ; -24..24

  ; clamp to [-3, 3]
  LDI r15, 0xFFFFFFFD   ; -3 unsigned
  CMP r7, r15
  BLT r10, dx_neg
  LDI r15, 3
  CMP r7, r15
  BGE r10, dx_pos
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
  LDI r5, 0x3023
  STORE r5, r7
  ; paddle hit sound
  LDI r13, 440
  LDI r15, 20
  BEEP r13, r15

draw_and_loop:
  CALL draw_frame
  FRAME
  JMP game_loop

; ── input handlers ───────────────────────────────────────────────
pad_left:
  LDI r5, 0x3020
  LOAD r7, r5
  LDI r13, 5
  SUB r7, r13
  LDI r15, 0
  CMP r7, r15
  BGE r10, pl_ok
  LDI r7, 0
pl_ok:
  LDI r5, 0x3020
  STORE r5, r7
  JMP after_input

pad_right:
  LDI r5, 0x3020
  LOAD r7, r5
  LDI r13, 5
  ADD r7, r13
  LDI r15, 208           ; 256 - 48
  CMP r7, r15
  BLT r10, pr_ok
  LDI r7, 208
pr_ok:
  LDI r5, 0x3020
  STORE r5, r7
  JMP after_input

do_launch:
  LDI r5, 0x3028
  LOAD r7, r5
  JNZ r7, after_input  ; already launched
  LDI r7, 1
  LDI r5, 0x3028
  STORE r5, r7
  JMP after_input

; ── subroutines ──────────────────────────────────────────────────
reset_ball:
  LDI r7, 0
  LDI r5, 0x3028
  STORE r5, r7         ; ball_launched = 0
  LDI r7, 2
  LDI r5, 0x3023
  STORE r5, r7         ; ball_dx = 2
  LDI r7, 0xFFFFFFFD   ; -3
  LDI r5, 0x3024
  STORE r5, r7         ; ball_dy = -3
  RET

lose_life:
  PUSH r31
  LDI r5, 0x3026
  LOAD r7, r5
  LDI r13, 1
  SUB r7, r13
  LDI r5, 0x3026
  STORE r5, r7
  JNZ r7, ll_reset
  ; game over (lost)
  LDI r7, 2
  LDI r5, 0x3027
  STORE r5, r7
  LDI r13, 110
  LDI r15, 300
  BEEP r13, r15
  POP r31
  RET

ll_reset:
  CALL reset_ball
  POP r31
  RET

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r5, 0x3027
  LOAD r7, r5
  LDI r15, 1
  CMP r7, r15
  JZ r10, win_screen

  ; lose screen (dark red)
  LDI r7, 0x330000
  FILL r7
  FRAME
  IKEY r9
  JZ r9, game_over_screen
  JMP restart

win_screen:
  ; win screen (dark green)
  LDI r7, 0x003300
  FILL r7
  FRAME
  IKEY r9
  JZ r9, win_screen
  JMP restart

; ─────────────────────────────────────────────────────────────────
; draw_frame -- render entire screen
;   Clobbers r7-r12, r3. Preserves r20-r25.
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; dark background
  LDI r7, 0x000811
  FILL r7

  ; ── draw bricks ──
  LDI r3, 0           ; brick index
  LDI r20, 0x3000      ; brick base

df_bloop:
  ; load brick color
  LDI r5, 0
  ADD r5, r20
  ADD r5, r3
  LOAD r7, r5          ; r7 = color (0 = dead)
  JZ r7, df_bnext

  ; compute pixel position
  LDI r13, 0
  ADD r13, r3
  LDI r15, 7
  AND r13, r15           ; r13 = col (0-7)
  LDI r14, 5
  SHL r13, r14           ; r13 = col * 32

  LDI r15, 0
  ADD r15, r3
  LDI r14, 3
  SHR r15, r14           ; r15 = row (0-3)
  LDI r14, 3
  SHL r15, r14           ; r15 = row * 8
  LDI r14, 9
  ADD r15, r14           ; r15 = row * 8 + 9 (1px top gap)

  ; draw brick: RECTF(x+1, y+1, 30, 6, color)
  LDI r9, 1
  ADD r13, r9           ; x + 1
  ADD r15, r9           ; y + 1
  LDI r9, 30           ; width
  LDI r14, 6            ; height
  RECTF r13, r15, r9, r14, r7

df_bnext:
  LDI r13, 1
  ADD r3, r13
  LDI r15, 32
  CMP r3, r15
  BLT r10, df_bloop

  ; ── draw paddle ──
  LDI r5, 0x3020
  LOAD r13, r5          ; r13 = paddle_x
  LDI r15, 244           ; y
  LDI r9, 48            ; width
  LDI r14, 6             ; height
  LDI r12, 0xCCCCCC      ; light gray
  RECTF r13, r15, r9, r14, r12

  ; ── draw ball ──
  LDI r5, 0x3021
  LOAD r13, r5          ; ball_x
  LDI r5, 0x3022
  LOAD r15, r5          ; ball_y
  LDI r9, 4            ; width
  LDI r14, 4            ; height
  LDI r12, 0xFFFFFF     ; white
  RECTF r13, r15, r9, r14, r12

  ; ── draw score text ──
  CALL draw_score

  ; ── draw lives (small rects at bottom-right) ──
  LDI r5, 0x3026
  LOAD r7, r5          ; lives
  LDI r12, 0            ; loop counter
  LDI r3, 240         ; x start
df_lloop:
  CMP r12, r7
  BGE r10, df_ldone
  LDI r13, 0
  ADD r13, r3
  LDI r15, 252           ; y
  LDI r9, 4             ; w
  LDI r14, 4             ; h
  LDI r2, 0x00CC44     ; green
  RECTF r13, r15, r9, r14, r2
  LDI r13, 6
  ADD r3, r13           ; next life dot x += 6
  LDI r13, 1
  ADD r12, r13
  JMP df_lloop

df_ldone:
  RET

; ─────────────────────────────────────────────────────────────────
; draw_score -- convert score to 3-digit ASCII and display with TEXT
;   Writes digits to RAM[0x3106..0x3108], null at 0x3109
; ─────────────────────────────────────────────────────────────────
draw_score:
  LDI r5, 0x3025
  LOAD r7, r5          ; r7 = score

  ; hundreds digit: score / 100
  LDI r2, 0
  ADD r2, r7           ; r2 = score copy
  LDI r8, 100
  DIV r2, r8           ; r2 = hundreds
  LDI r13, 48
  ADD r2, r13           ; r2 = '0' + hundreds
  LDI r5, 0x3106
  STORE r5, r2

  ; tens digit: (score - hundreds*100) / 10
  LDI r8, 100
  LDI r15, 0
  ADD r15, r2           ; r15 = ASCII hundreds
  LDI r13, 48
  SUB r15, r13           ; r15 = numeric hundreds
  MUL r15, r8           ; r15 = hundreds * 100
  LDI r2, 0
  ADD r2, r7           ; r2 = score
  SUB r2, r15           ; r2 = remainder (< 100)
  LDI r8, 10
  DIV r2, r8           ; r2 = tens
  LDI r13, 48
  ADD r2, r13           ; r2 = '0' + tens
  LDI r5, 0x3107
  STORE r5, r2

  ; ones digit: remainder - tens*10
  LDI r8, 10
  LDI r15, 0
  ADD r15, r2           ; r15 = ASCII tens
  LDI r13, 48
  SUB r15, r13           ; r15 = numeric tens
  MUL r15, r8           ; r15 = tens * 10
  SUB r2, r15           ; r2 = ones
  LDI r13, 48
  ADD r2, r13           ; r2 = '0' + ones
  LDI r5, 0x3108
  STORE r5, r2

  ; null terminator
  LDI r7, 0
  LDI r5, 0x3109
  STORE r5, r7

  ; TEXT opcode to render "SCORE:XXX"
  LDI r13, 2             ; x
  LDI r15, 0             ; y
  LDI r9, 0x3100        ; string address
  TEXT r13, r15, r9

  RET
