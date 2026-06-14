; pong.asm -- Classic Pong with AI opponent for Geometry OS
; Controls: W/Up = paddle up, S/Down = paddle down, R = restart
; First to 5 points wins. Ball speeds up after each score.
; Sound effects on paddle hit, wall bounce, and score.
;
; Memory layout:
;   0x2000 = player_score (0-5)
;   0x2001 = ai_score (0-5)
;   0x2002 = ball_x
;   0x2003 = ball_y
;   0x2004 = ball_dx (signed)
;   0x2005 = ball_dy (signed)
;   0x2006 = player_y (paddle top, clamped 0-208)
;   0x2007 = ai_y (paddle top, clamped 0-208)
;   0x2008 = serve_dir (1=right, -1=left)
;   0x2009 = base_speed (3-7, increases each score)
;   0x5000-0x500F = score text buffer
;   0x5020-0x502F = "Press R" text buffer (built at init)
;
; Key bitmask (0xFFB): bit0=Up/W, bit1=Down/S
;
; Register conventions:
;   r0 = CMP result ONLY (never use as general register)
;   r1-r6 = scratch / RAM pointers / comparison values
;   r7 = key bitmask (loaded once per frame)
;   r8 = constant 1
;   r9 = black (0)
;   r14 = BEEP frequency
;   r15 = BEEP duration
;   r30 = SP
;   r31 = LR

; ===== ENTRY / RESTART =====
start:
  LDI r30, 0xFE00

  ; Constants
  LDI r8, 1
  LDI r9, 0

  ; Init scores
  LDI r4, 0x2000
  LDI r1, 0
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r1

  ; Init paddle positions (centered vertically)
  LDI r4, 0x2006
  LDI r1, 104
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r1

  ; Serve direction and base speed
  ADDI r4, 1
  LDI r1, 1
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 3
  STORE r4, r1

  ; Pre-build "Press R" at 0x5020 (persists across game states)
  LDI r4, 0x5020
  LDI r1, 80
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 114
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 101
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 115
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 115
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 32
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 82
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0
  STORE r4, r1

  ; Reset ball to center
  PUSH r31
  CALL reset_ball
  POP r31

; ===== MAIN GAME LOOP =====
game_loop:
  ; Check win conditions
  LDI r4, 0x2000
  LOAD r1, r4
  LDI r6, 5
  CMP r1, r6
  JZ r0, player_wins

  LDI r4, 0x2001
  LOAD r1, r4
  CMP r1, r6
  JZ r0, ai_wins

  ; Read key bitmask for paddle control
  LDI r4, 0xFFB
  LOAD r7, r4

  ; Check R key for restart
  IKEY r6
  CMPI r6, 82
  JZ r0, start
  CMPI r6, 114
  JZ r0, start

  ; ── UPDATE PLAYER PADDLE ──
  ; bit 0 = up
  MOV r1, r7
  LDI r6, 1
  AND r1, r6
  JZ r1, chk_pdown
  LDI r4, 0x2006
  LOAD r2, r4
  LDI r3, 5
  CMP r2, r3
  BLT r0, p_top_lim
  SUB r2, r3
  STORE r4, r2
  JMP chk_pdown
p_top_lim:
  LDI r2, 0
  STORE r4, r2

chk_pdown:
  ; bit 1 = down
  MOV r1, r7
  LDI r6, 2
  AND r1, r6
  JZ r1, player_done
  LDI r4, 0x2006
  LOAD r2, r4
  LDI r3, 208
  CMP r2, r3
  BGE r0, p_bot_lim
  ADDI r2, 5
  STORE r4, r2
  JMP player_done
p_bot_lim:
  LDI r2, 208
  STORE r4, r2
player_done:

  ; ── UPDATE AI PADDLE ──
  ; Simple AI: move toward ball y center, speed 3
  LDI r4, 0x2003
  LOAD r1, r4
  LDI r4, 0x2007
  LOAD r2, r4
  LDI r3, 24
  ADD r2, r3
  CMP r1, r2
  JZ r0, ai_done
  BLT r0, ai_move_up
  ; Move down
  LDI r4, 0x2007
  LOAD r2, r4
  LDI r3, 208
  CMP r2, r3
  BGE r0, ai_done
  ADDI r2, 3
  STORE r4, r2
  JMP ai_done
ai_move_up:
  LDI r4, 0x2007
  LOAD r2, r4
  LDI r3, 3
  CMP r2, r3
  BLT r0, ai_done
  SUB r2, r3
  STORE r4, r2
ai_done:

  ; ── MOVE BALL ──
  LDI r4, 0x2002
  LOAD r1, r4
  LDI r5, 0x2004
  LOAD r2, r5
  ADD r1, r2
  STORE r4, r1

  LDI r4, 0x2003
  LOAD r1, r4
  LDI r5, 0x2005
  LOAD r2, r5
  ADD r1, r2
  STORE r4, r1

  ; ── WALL BOUNCE (top/bottom) ──
  LDI r4, 0x2003
  LOAD r1, r4
  LDI r6, 4
  CMP r1, r6
  BGE r0, wall_bot
  LDI r1, 4
  STORE r4, r1
  LDI r5, 0x2005
  LOAD r2, r5
  NEG r2
  STORE r5, r2
  LDI r14, 330
  LDI r15, 20
  BEEP r14, r15
  JMP chk_ppaddle

wall_bot:
  LDI r6, 251
  CMP r1, r6
  BLT r0, chk_ppaddle
  LDI r1, 251
  STORE r4, r1
  LDI r5, 0x2005
  LOAD r2, r5
  NEG r2
  STORE r5, r2
  LDI r14, 330
  LDI r15, 20
  BEEP r14, r15

  ; ── PLAYER PADDLE COLLISION ──
chk_ppaddle:
  ; Check ball moving left (dx negative)
  LDI r4, 0x2004
  LOAD r1, r4
  LDI r3, 31
  SAR r1, r3
  JZ r1, chk_apaddle

  ; Check x range: 12 <= ball_x <= 28
  LDI r4, 0x2002
  LOAD r1, r4
  LDI r6, 28
  CMP r1, r6
  BGE r0, chk_apaddle
  LDI r6, 12
  CMP r1, r6
  BLT r0, chk_apaddle

  ; Check y range: player_y <= ball_y <= player_y + 48
  LDI r4, 0x2006
  LOAD r2, r4
  LDI r4, 0x2003
  LOAD r1, r4
  CMP r1, r2
  BLT r0, chk_apaddle
  LDI r3, 48
  ADD r2, r3
  CMP r1, r2
  BGE r0, chk_apaddle

  ; HIT player paddle! Set dx = +base_speed
  LDI r4, 0x2009
  LOAD r1, r4
  LDI r4, 0x2004
  STORE r4, r1
  ; Clamp ball_x past paddle
  LDI r4, 0x2002
  LDI r1, 29
  STORE r4, r1

  ; Adjust dy by paddle hit zone (3 zones)
  LDI r4, 0x2006
  LOAD r2, r4
  LDI r4, 0x2003
  LOAD r1, r4
  SUB r1, r2
  LDI r6, 16
  CMP r1, r6
  BGE r0, pz2
  LDI r1, 2
  NEG r1
  JMP pdy
pz2:
  LDI r6, 32
  CMP r1, r6
  BGE r0, pz3
  LDI r1, 0
  JMP pdy
pz3:
  LDI r1, 2
pdy:
  LDI r4, 0x2005
  STORE r4, r1
  ; Paddle hit sound
  LDI r14, 440
  LDI r15, 40
  BEEP r14, r15
  JMP draw_frame

  ; ── AI PADDLE COLLISION ──
chk_apaddle:
  ; Check ball moving right (dx positive)
  LDI r4, 0x2004
  LOAD r1, r4
  LDI r3, 31
  SAR r1, r3
  JNZ r1, chk_score

  ; Check x range: 228 <= ball_x <= 244
  LDI r4, 0x2002
  LOAD r1, r4
  LDI r6, 228
  CMP r1, r6
  BLT r0, chk_score
  LDI r6, 244
  CMP r1, r6
  BGE r0, chk_score

  ; Check y range: ai_y <= ball_y <= ai_y + 48
  LDI r4, 0x2007
  LOAD r2, r4
  LDI r4, 0x2003
  LOAD r1, r4
  CMP r1, r2
  BLT r0, chk_score
  LDI r3, 48
  ADD r2, r3
  CMP r1, r2
  BGE r0, chk_score

  ; HIT AI paddle! Set dx = -base_speed
  LDI r4, 0x2009
  LOAD r1, r4
  NEG r1
  LDI r4, 0x2004
  STORE r4, r1
  ; Clamp ball_x past paddle
  LDI r4, 0x2002
  LDI r1, 227
  STORE r4, r1

  ; Adjust dy by paddle hit zone
  LDI r4, 0x2007
  LOAD r2, r4
  LDI r4, 0x2003
  LOAD r1, r4
  SUB r1, r2
  LDI r6, 16
  CMP r1, r6
  BGE r0, az2
  LDI r1, 2
  NEG r1
  JMP ady
az2:
  LDI r6, 32
  CMP r1, r6
  BGE r0, az3
  LDI r1, 0
  JMP ady
az3:
  LDI r1, 2
ady:
  LDI r4, 0x2005
  STORE r4, r1
  ; Paddle hit sound
  LDI r14, 440
  LDI r15, 40
  BEEP r14, r15
  JMP draw_frame

  ; ── SCORING ──
chk_score:
  ; Left wall: ball_x <= 3 (signed CMP handles underflow wrapping)
  LDI r4, 0x2002
  LOAD r1, r4
  LDI r6, 3
  CMP r1, r6
  BGE r0, chk_rscore

  ; AI scores!
  LDI r4, 0x2001
  LOAD r1, r4
  ADDI r1, 1
  STORE r4, r1
  LDI r14, 220
  LDI r15, 80
  BEEP r14, r15
  PUSH r31
  CALL speed_up
  POP r31
  LDI r4, 0x2008
  LOAD r1, r4
  NEG r1
  STORE r4, r1
  PUSH r31
  CALL reset_ball
  POP r31
  JMP game_loop

chk_rscore:
  LDI r4, 0x2002
  LOAD r1, r4
  LDI r6, 253
  CMP r1, r6
  BLT r0, draw_frame

  ; Player scores!
  LDI r4, 0x2000
  LOAD r1, r4
  ADDI r1, 1
  STORE r4, r1
  LDI r14, 660
  LDI r15, 80
  BEEP r14, r15
  PUSH r31
  CALL speed_up
  POP r31
  LDI r4, 0x2008
  LOAD r1, r4
  NEG r1
  STORE r4, r1
  PUSH r31
  CALL reset_ball
  POP r31
  JMP game_loop

; ===== DRAW FRAME =====
draw_frame:
  FILL r9

  ; Center dividing line (solid gray, 2px wide)
  LDI r1, 127
  LDI r2, 0
  LDI r3, 2
  LDI r4, 256
  LDI r5, 0x444444
  RECTF r1, r2, r3, r4, r5

  ; Player paddle (cyan)
  LDI r5, 0x2006
  LOAD r2, r5
  LDI r1, 16
  LDI r3, 8
  LDI r4, 48
  LDI r5, 0x00FFFF
  RECTF r1, r2, r3, r4, r5

  ; AI paddle (orange)
  LDI r5, 0x2007
  LOAD r2, r5
  LDI r1, 232
  LDI r3, 8
  LDI r4, 48
  LDI r5, 0xFF8800
  RECTF r1, r2, r3, r4, r5

  ; Ball (white circle)
  LDI r5, 0x2002
  LOAD r1, r5
  LDI r5, 0x2003
  LOAD r2, r5
  LDI r3, 4
  LDI r4, 0xFFFFFF
  CIRCLE r1, r2, r3, r4

  ; Draw score text
  PUSH r31
  CALL draw_score
  POP r31

  FRAME
  JMP game_loop

; ===== RESET BALL =====
; Places ball at center, sets dx from serve_dir * base_speed,
; sets dy to random direction using TICKS parity
reset_ball:
  LDI r4, 0x2002
  LDI r1, 128
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r1

  ; dx = serve_dir * base_speed
  ADDI r4, 1
  LDI r5, 0x2008
  LOAD r2, r5
  LDI r5, 0x2009
  LOAD r1, r5
  CMPI r2, 1
  JZ r0, rb_right
  NEG r1
rb_right:
  STORE r4, r1

  ; dy based on TICKS parity for variety
  ADDI r4, 1
  LDI r5, 0xFFE
  LOAD r3, r5
  LDI r6, 1
  AND r3, r6
  JZ r3, rb_neg
  LDI r1, 2
  JMP rb_dy
rb_neg:
  LDI r1, 2
  NEG r1
rb_dy:
  STORE r4, r1
  RET

; ===== SPEED UP =====
; Increase base_speed after each score, cap at 7
speed_up:
  LDI r4, 0x2009
  LOAD r1, r4
  LDI r6, 7
  CMP r1, r6
  BGE r0, sp_max
  ADDI r1, 1
  STORE r4, r1
sp_max:
  RET

; ===== DRAW SCORE =====
; Builds "Px - Ay" at 0x5000 and renders it
draw_score:
  LDI r4, 0x5000
  LDI r1, 80
  STORE r4, r1
  ADDI r4, 1
  LDI r5, 0x2000
  LOAD r1, r5
  ADDI r1, 48
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 32
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 45
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 32
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 65
  STORE r4, r1
  ADDI r4, 1
  LDI r5, 0x2001
  LOAD r1, r5
  ADDI r1, 48
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0
  STORE r4, r1

  LDI r10, 100
  LDI r11, 4
  LDI r12, 0x5000
  TEXT r10, r11, r12
  RET

; ===== PLAYER WINS SCREEN =====
player_wins:
  FILL r9

  ; "YOU WIN!" at 0x5000
  LDI r4, 0x5000
  LDI r1, 89
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 79
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 85
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 32
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 87
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 73
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 78
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 33
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0
  STORE r4, r1

  LDI r10, 80
  LDI r11, 100
  LDI r12, 0x5000
  TEXT r10, r11, r12

  ; "Press R" (pre-built at 0x5020)
  LDI r10, 92
  LDI r11, 130
  LDI r12, 0x5020
  TEXT r10, r11, r12

  FRAME
  IKEY r6
  CMPI r6, 82
  JZ r0, start
  CMPI r6, 114
  JZ r0, start
  JMP player_wins

; ===== AI WINS SCREEN =====
ai_wins:
  FILL r9

  ; "AI WINS!" at 0x5000
  LDI r4, 0x5000
  LDI r1, 65
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 73
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 32
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 87
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 73
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 78
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 83
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 33
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0
  STORE r4, r1

  LDI r10, 80
  LDI r11, 100
  LDI r12, 0x5000
  TEXT r10, r11, r12

  ; "Press R" (pre-built at 0x5020)
  LDI r10, 92
  LDI r11, 130
  LDI r12, 0x5020
  TEXT r10, r11, r12

  FRAME
  IKEY r6
  CMPI r6, 82
  JZ r0, start
  CMPI r6, 114
  JZ r0, start
  JMP ai_wins
