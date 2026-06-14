; simon_says.asm -- Simon Says memory game
;
; Flashes a sequence of colored quadrants; player repeats by pressing 1-4.
; Each round adds one step. Wrong input = game over.
;
; Memory layout:
;   0x2000  sequence_length (starts at 1)
;   0x2001  player_pos (0-based index)
;   0x2002  state (0=showing 1=input 2=game_over)
;   0x2003  flash_index
;   0x2004  flash_timer (countdown)
;   0x2005  flash_color (1-4)
;   0x2006  frame_counter
;   0x2007  score
;   0x2010+ sequence buffer (max 240 steps)
;   0x2100  high_score
;
; Screen: 4 quadrants each 128x128
;   Q0 Green  TL  Q1 Red    TR
;   Q2 Blue   BL  Q3 Yellow BR
;
; Keys: 1=Green 2=Red 3=Blue 4=Yellow R=Restart

; ── Init ──────────────────────────────────────────────────────
restart:
  LDI r30, 0x8000
  LDI r1, 1
  LDI r4, 0x2000
  STORE r4, r1
  LDI r1, 0
  LDI r4, 0x2001
  STORE r4, r1
  LDI r4, 0x2002
  STORE r4, r1
  LDI r4, 0x2003
  STORE r4, r1
  LDI r1, 30
  LDI r4, 0x2004
  STORE r4, r1
  LDI r1, 0
  LDI r4, 0x2005
  STORE r4, r1
  LDI r4, 0x2006
  STORE r4, r1
  LDI r4, 0x2007
  STORE r4, r1
  CALL add_random_step
  JMP game_loop

; ── Add Random Step ───────────────────────────────────────────
add_random_step:
  PUSH r31
  LDI r4, 0x2000
  LOAD r5, r4           ; r5 = length
  LDI r6, 240
  CMP r5, r6
  BGE r0, ars_done      ; max 240
  RAND r7               ; random u32
  LDI r6, 4
  MOD r7, r6            ; 0..3
  LDI r6, 1
  ADD r7, r6            ; 1..4
  LDI r8, 0x2010
  ADD r8, r5
  STORE r8, r7          ; seq[length] = color
  ADD r5, r6            ; length++
  LDI r4, 0x2000
  STORE r4, r5
ars_done:
  POP r31
  RET

; ── Draw All Quadrants (dim) ──────────────────────────────────
draw_all_dim:
  PUSH r31
  LDI r1, 0
  LDI r2, 0x003300
  CALL draw_quad
  LDI r1, 1
  LDI r2, 0x330000
  CALL draw_quad
  LDI r1, 2
  LDI r2, 0x000033
  CALL draw_quad
  LDI r1, 3
  LDI r2, 0x333300
  CALL draw_quad
  POP r31
  RET

; ── Draw Quadrant ─────────────────────────────────────────────
; r1 = quadrant (0-3)  r2 = color
draw_quad:
  PUSH r31
  MOV r10, r1
  LDI r11, 2
  MOV r12, r10
  MOD r12, r11         ; x = q % 2
  LDI r11, 128
  MUL r12, r11         ; x *= 128
  MOV r10, r1
  LDI r11, 2
  DIV r10, r11         ; y = q / 2
  LDI r11, 128
  MUL r10, r11         ; y *= 128
  LDI r11, 128
  RECTF r12, r10, r11, r11, r2
  POP r31
  RET

; ── Flash Bright Quadrant ─────────────────────────────────────
; r5 = color (1-4)
flash_bright:
  PUSH r31
  CALL draw_all_dim
  LDI r6, 1
  SUB r5, r6           ; r5 = quadrant (0-3)
  MOV r1, r5
  LDI r2, 0x00FF00     ; green default
  LDI r6, 0
  CMP r1, r6
  JZ r0, fb_draw
  LDI r2, 0xFF0000     ; red
  LDI r6, 1
  CMP r1, r6
  JZ r0, fb_draw
  LDI r2, 0x0000FF     ; blue
  LDI r6, 2
  CMP r1, r6
  JZ r0, fb_draw
  LDI r2, 0xFFFF00     ; yellow
fb_draw:
  CALL draw_quad
  POP r31
  RET

; ── Main Game Loop ────────────────────────────────────────────
game_loop:
  ; increment frame counter
  LDI r4, 0x2006
  LOAD r5, r4
  ADD r5, r6
  LDI r6, 1
  ADD r5, r6
  LDI r4, 0x2006
  STORE r4, r5

  ; dispatch on state
  LDI r4, 0x2002
  LOAD r5, r4           ; r5 = state
  LDI r6, 0
  CMP r5, r6
  JZ r0, state_showing
  LDI r6, 1
  CMP r5, r6
  JZ r0, state_input
  JMP state_game_over

; ── State: Showing Sequence ───────────────────────────────────
state_showing:
  CALL draw_all_dim

  ; decrement flash timer
  LDI r4, 0x2004
  LOAD r5, r4
  LDI r6, 1
  SUB r5, r6
  LDI r4, 0x2004
  STORE r4, r5

  ; if timer > 0, flash current color
  JNZ r5, do_flash

  ; timer expired: advance flash_index
  LDI r4, 0x2003
  LOAD r5, r4           ; r5 = flash_index
  LDI r4, 0x2000
  LOAD r6, r4           ; r6 = sequence_length
  CMP r5, r6
  BLT r0, next_flash

  ; sequence fully shown: switch to input
  LDI r4, 0x2002
  LDI r5, 1
  STORE r4, r5          ; state = input
  LDI r4, 0x2001
  LDI r5, 0
  STORE r4, r5          ; player_pos = 0
  LDI r4, 0x2006
  LDI r5, 0
  STORE r4, r5          ; frame_counter = 0
  JMP game_loop

next_flash:
  ; load next color from sequence[flash_index]
  LDI r4, 0x2003
  LOAD r5, r4           ; r5 = flash_index
  LDI r6, 0x2010
  ADD r6, r5
  LOAD r5, r6           ; r5 = color (1-4)
  LDI r4, 0x2005
  STORE r4, r5          ; flash_color = color

  ; increment flash_index
  LDI r4, 0x2003
  LOAD r5, r4
  ADD r5, r6
  LDI r6, 1
  ADD r5, r6
  LDI r4, 0x2003
  STORE r4, r5

  ; reset flash_timer
  LDI r5, 30
  LDI r4, 0x2004
  STORE r4, r5
  JMP game_loop

do_flash:
  ; last 10 frames = gap (dim), rest = bright
  LDI r4, 0x2004
  LOAD r5, r4
  LDI r6, 10
  CMP r5, r6
  BLT r0, flash_gap

  LDI r4, 0x2005
  LOAD r5, r4           ; r5 = flash_color
  CALL flash_bright
  FRAME
  JMP game_loop

flash_gap:
  FRAME
  JMP game_loop

; ── State: Input ──────────────────────────────────────────────
state_input:
  CALL draw_all_dim
  IKEY r7               ; r7 = key (0 if none)

  LDI r6, 49
  CMP r7, r6
  JZ r0, input_1
  LDI r6, 50
  CMP r7, r6
  JZ r0, input_2
  LDI r6, 51
  CMP r7, r6
  JZ r0, input_3
  LDI r6, 52
  CMP r7, r6
  JZ r0, input_4

  ; no valid input
  FRAME
  JMP game_loop

input_1:
  LDI r5, 1
  JMP check_input

input_2:
  LDI r5, 2
  JMP check_input

input_3:
  LDI r5, 3
  JMP check_input

input_4:
  LDI r5, 4

check_input:
  ; flash the pressed quadrant
  PUSH r5               ; save color (1-4)
  LDI r6, 1
  SUB r5, r6           ; r5 = quadrant (0-3)
  MOV r1, r5
  LDI r2, 0x00FF00
  LDI r6, 0
  CMP r1, r6
  JZ r0, ci_draw
  LDI r2, 0xFF0000
  LDI r6, 1
  CMP r1, r6
  JZ r0, ci_draw
  LDI r2, 0x0000FF
  LDI r6, 2
  CMP r1, r6
  JZ r0, ci_draw
  LDI r2, 0xFFFF00
ci_draw:
  CALL draw_quad
  FRAME
  CALL draw_all_dim

  ; compare with expected
  POP r5                ; r5 = player color (1-4)
  LDI r4, 0x2001
  LOAD r8, r4           ; r8 = player_pos
  LDI r4, 0x2010
  ADD r4, r8
  LOAD r9, r4           ; r9 = expected color
  CMP r5, r9
  JNZ r0, input_wrong

  ; correct: advance player_pos
  LDI r6, 1
  ADD r8, r6
  LDI r4, 0x2001
  STORE r4, r8

  ; check if round complete
  LDI r4, 0x2000
  LOAD r10, r4          ; r10 = sequence_length
  CMP r8, r10
  BLT r0, game_loop     ; more input needed

  ; round complete! update score
  LDI r4, 0x2007
  LOAD r5, r4
  ADD r5, r6
  LDI r4, 0x2007
  STORE r4, r5          ; score++

  ; update high score
  LDI r4, 0x2100
  LOAD r8, r4
  CMP r5, r8
  BLT r0, new_round
  LDI r4, 0x2100
  STORE r4, r5          ; new high score

new_round:
  CALL add_random_step
  LDI r4, 0x2002
  LDI r5, 0
  STORE r4, r5          ; state = showing
  LDI r4, 0x2003
  LDI r5, 0
  STORE r4, r5          ; flash_index = 0
  LDI r5, 30
  LDI r4, 0x2004
  STORE r4, r5          ; flash_timer = 30
  LDI r4, 0x2006
  LDI r5, 0
  STORE r4, r5
  JMP game_loop

input_wrong:
  LDI r4, 0x2002
  LDI r5, 2
  STORE r4, r5          ; state = game_over
  JMP game_loop

; ── State: Game Over ──────────────────────────────────────────
state_game_over:
  LDI r1, 0x111111
  FILL r1

  ; GAME OVER text
  LDI r10, 0x3000
  STRO r10, "GAME OVER"
  LDI r11, 80
  LDI r12, 90
  TEXT r11, r12, r10

  ; Score label
  LDI r10, 0x3100
  STRO r10, "Score:"
  LDI r11, 92
  LDI r12, 120
  TEXT r11, r12, r10

  ; Draw score blocks (1 pixel column per point)
  LDI r4, 0x2007
  LOAD r5, r4           ; r5 = score
  LDI r8, 160           ; x start
score_loop:
  LDI r6, 0
  CMP r5, r6
  JZ r0, score_done
  LDI r1, 0x00CCFF
  PSET r8, r12, r1
  LDI r6, 1
  ADD r8, r6
  SUB r5, r6
  JMP score_loop

score_done:
  ; Best label
  LDI r10, 0x3200
  STRO r10, "Best:"
  LDI r11, 96
  LDI r12, 145
  TEXT r11, r12, r10

  ; Draw best blocks
  LDI r4, 0x2100
  LOAD r5, r4           ; r5 = high score
  LDI r8, 160
best_loop:
  LDI r6, 0
  CMP r5, r6
  JZ r0, best_done
  LDI r1, 0xFFCC00
  PSET r8, r12, r1
  LDI r6, 1
  ADD r8, r6
  SUB r5, r6
  JMP best_loop

best_done:
  ; Restart prompt
  LDI r10, 0x3300
  STRO r10, "Press R"
  LDI r11, 88
  LDI r12, 190
  TEXT r11, r12, r10

  ; Check restart
  IKEY r7
  LDI r6, 82            ; R
  CMP r7, r6
  JZ r0, restart
  LDI r6, 114           ; r
  CMP r7, r6
  JZ r0, restart

  FRAME
  JMP state_game_over
