; Tic-Tac-Toe for Geometry OS
; Two-player game using keyboard selection
; Draws X/O with LINE opcode
; Win detection for 3 in a row
; Turn management with 'X' first, then 'O' alternates
; 'r' key resets the game

; Memory map:
; 0x3000-0x3008 - board state (9 cells: 0=empty, 1=X, 2=O)
; 0x3009 - current turn (1=X, 2=O)
; 0x300A - game state (0=playing, 1=X wins, 2=O wins, 3=draw)
; 0x300B - cursor position (0-8)

; Constants
BOARD_ADDR    equ 0x3000
TURN_ADDR     equ 0x3009
GAME_STATE    equ 0x300A
CURSOR        equ 0x300B

; Colors
COLOR_BG      equ 0x000000
COLOR_GRID    equ 0x0088FF
COLOR_X       equ 0x00FF00
COLOR_O       equ 0xFF0000
COLOR_CURSOR  equ 0xFFFF00
COLOR_TEXT    equ 0xFFFFFF

; Grid cell centers (256x256 screen)
; 3x3 grid with spacing
CELL_SIZE     equ 80
MARGIN        equ 8
START_X       equ 24
START_Y       equ 24

; Position lookup table (x, y) for cells 0-8
POS_TABLE     equ 0x3100

; Win combinations (row, col, diag)
WIN_COMBS     equ 0x3120
; Each combination is 3 cell indices (0-8)

; Initialize board with zeros
LDI r0, 0
LDI r1, BOARD_ADDR
LDI r2, 9
init_board:
  STORE r1, r0    ; board[i] = 0
  ADD r1, r1, 1   ; r1++
  ADD r0, r0, 1   ; i++
  CMP r0, r2
  BLT r0, init_board

; Set turn to X (1)
LDI r0, 1
LDI r1, TURN_ADDR
STORE r1, r0

; Set game state to playing (0)
LDI r0, 0
LDI r1, GAME_STATE
STORE r1, r0

; Set cursor to cell 0
LDI r0, 0
LDI r1, CURSOR
STORE r1, r0

; Build position table (x, y coordinates for each cell)
; Cell 0 (0,0): x=24+40=64, y=24+40=64
; We precompute for speed
LDI r0, 64       ; center of first cell
LDI r1, POS_TABLE
STORE r1, r0     ; cell 0 x
LDI r1, POS_TABLE
ADD r1, r1, 1
STORE r1, r0     ; cell 0 y (same x for top-left)

LDI r0, 144      ; cell 1 x (24+80+40)
LDI r1, POS_TABLE
ADD r1, r1, 2
STORE r1, r0     ; cell 1 x
LDI r1, POS_TABLE
ADD r1, r1, 3
STORE r1, r0     ; cell 1 y

LDI r0, 224      ; cell 2 x (24+160+40)
LDI r1, POS_TABLE
ADD r1, r1, 4
STORE r1, r0     ; cell 2 x
LDI r1, POS_TABLE
ADD r1, r1, 5
LDI r2, 144
STORE r1, r2     ; cell 2 y (144 for row 0)

; Row 1: y=144
LDI r2, 144
LDI r1, POS_TABLE
ADD r1, r1, 6
LDI r0, 64
STORE r1, r0     ; cell 3 x
LDI r1, POS_TABLE
ADD r1, r1, 7
STORE r1, r2     ; cell 3 y

LDI r1, POS_TABLE
ADD r1, r1, 8
LDI r0, 144
STORE r1, r0     ; cell 4 x
LDI r1, POS_TABLE
ADD r1, r1, 9
STORE r1, r2     ; cell 4 y

LDI r1, POS_TABLE
ADD r1, r1, 10
LDI r0, 224
STORE r1, r0     ; cell 5 x
LDI r1, POS_TABLE
ADD r1, r1, 11
STORE r1, r2     ; cell 5 y

; Row 2: y=224
LDI r2, 224
LDI r1, POS_TABLE
ADD r1, r1, 12
LDI r0, 64
STORE r1, r0     ; cell 6 x
LDI r1, POS_TABLE
ADD r1, r1, 13
STORE r1, r2     ; cell 6 y

LDI r1, POS_TABLE
ADD r1, r1, 14
LDI r0, 144
STORE r1, r0     ; cell 7 x
LDI r1, POS_TABLE
ADD r1, r1, 15
STORE r1, r2     ; cell 7 y

LDI r1, POS_TABLE
ADD r1, r1, 16
LDI r0, 224
STORE r1, r0     ; cell 8 x
LDI r1, POS_TABLE
ADD r1, r1, 17
STORE r1, r2     ; cell 8 y

; Build win combinations table
; Row 0: 0,1,2
LDI r0, 0
LDI r1, WIN_COMBS
STORE r1, r0
LDI r1, WIN_COMBS
ADD r1, r1, 1
LDI r0, 1
STORE r1, r0
LDI r1, WIN_COMBS
ADD r1, r1, 2
LDI r0, 2
STORE r1, r0

; Row 1: 3,4,5
LDI r0, 3
LDI r1, WIN_COMBS
ADD r1, r1, 3
STORE r1, r0
LDI r1, WIN_COMBS
ADD r1, r1, 4
LDI r0, 4
STORE r1, r0
LDI r1, WIN_COMBS
ADD r1, r1, 5
LDI r0, 5
STORE r1, r0

; Row 2: 6,7,8
LDI r0, 6
LDI r1, WIN_COMBS
ADD r1, r1, 6
STORE r1, r0
LDI r1, WIN_COMBS
ADD r1, r1, 7
LDI r0, 7
STORE r1, r0
LDI r1, WIN_COMBS
ADD r1, r1, 8
LDI r0, 8
STORE r1, r0

; Col 0: 0,3,6
LDI r0, 0
LDI r1, WIN_COMBS
ADD r1, r1, 9
STORE r1, r0
LDI r1, WIN_COMBS
ADD r1, r1, 10
LDI r0, 3
STORE r1, r0
LDI r1, WIN_COMBS
ADD r1, r1, 11
LDI r0, 6
STORE r1, r0

; Col 1: 1,4,7
LDI r0, 1
LDI r1, WIN_COMBS
ADD r1, r1, 12
STORE r1, r0
LDI r1, WIN_COMBS
ADD r1, r1, 13
LDI r0, 4
STORE r1, r0
LDI r1, WIN_COMBS
ADD r1, r1, 14
LDI r0, 7
STORE r1, r0

; Col 2: 2,5,8
LDI r0, 2
LDI r1, WIN_COMBS
ADD r1, r1, 15
STORE r1, r0
LDI r1, WIN_COMBS
ADD r1, r1, 16
LDI r0, 5
STORE r1, r0
LDI r1, WIN_COMBS
ADD r1, r1, 17
LDI r0, 8
STORE r1, r0

; Diag 0: 0,4,8
LDI r0, 0
LDI r1, WIN_COMBS
ADD r1, r1, 18
STORE r1, r0
LDI r1, WIN_COMBS
ADD r1, r1, 19
LDI r0, 4
STORE r1, r0
LDI r1, WIN_COMBS
ADD r1, r1, 20
LDI r0, 8
STORE r1, r0

; Diag 1: 2,4,6
LDI r0, 2
LDI r1, WIN_COMBS
ADD r1, r1, 21
STORE r1, r0
LDI r1, WIN_COMBS
ADD r1, r1, 22
LDI r0, 4
STORE r1, r0
LDI r1, WIN_COMBS
ADD r1, r1, 23
LDI r0, 6
STORE r1, r0

; Main game loop
game_loop:
  ; Check for 'r' key (reset)
  CALL check_reset_key
  CMP r0, r2      ; r2 still has 8 from earlier? Need to reload
  LDI r2, 1
  CMP r0, r2
  BLT r0, reset_game

  ; Check for 'q' key (quit)
  CALL check_quit_key
  LDI r2, 1
  CMP r0, r2
  BLT r0, game_exit

  ; Render the game
  CALL render_game

  ; Handle input if game is playing
  LOAD r0, GAME_STATE
  LDI r1, 0
  CMP r0, r1
  JNZ r0, skip_input

  ; Read keyboard
  CALL read_input
  CALL process_input

skip_input:
  FRAME
  JMP game_loop

game_exit:
  HALT

; Reset game to initial state
reset_game:
  CALL init_board_state
  JMP game_loop

; Initialize board state
init_board_state:
  LDI r0, 0
  LDI r1, BOARD_ADDR
  LDI r2, 9
reset_loop:
  STORE r1, r0
  ADD r1, r1, 1
  ADD r0, r0, 1
  CMP r0, r2
  BLT r0, reset_loop

  ; Set turn to X
  LDI r0, 1
  LDI r1, TURN_ADDR
  STORE r1, r0

  ; Set game state to playing
  LDI r0, 0
  LDI r1, GAME_STATE
  STORE r1, r0

  ; Reset cursor to 0
  LDI r0, 0
  LDI r1, CURSOR
  STORE r1, r0
  RET

; Check for 'r' key (ASCII 114)
check_reset_key:
  ; Load from key bitmask port (0xFFB)
  LDI r0, 0xFFB
  LOAD r1, r0
  LDI r0, 0
  RET

; Check for 'q' key (ASCII 113)
check_quit_key:
  LDI r0, 0xFFB
  LOAD r1, r0
  LDI r0, 0
  RET

; Read keyboard input - returns key in r0
read_input:
  ; Use IKEY to read a single key
  LDI r0, 0xFFD
  LOAD r0, r0
  RET

; Process keyboard input
process_input:
  ; r0 contains the key
  LDI r1, 0        ; check for no key
  CMP r0, r1
  JZ r0, process_done

  ; Arrow keys for cursor movement
  ; Use key_bitmask for arrows: bit 0=up, 1=down, 2=left, 3=right
  LDI r1, 0xFFB
  LOAD r1, r1      ; key_bitmask

  ; Up arrow (bit 0)
  LDI r2, 1
  AND r1, r2
  CMP r1, r2
  JNZ r1, move_up

  ; Down arrow (bit 1)
  LDI r2, 2
  LDI r1, 0xFFB
  LOAD r1, r1
  AND r1, r2
  CMP r1, r2
  JNZ r1, move_down

  ; Left arrow (bit 2)
  LDI r2, 4
  LDI r1, 0xFFB
  LOAD r1, r1
  AND r1, r2
  CMP r1, r2
  JNZ r1, move_left

  ; Right arrow (bit 3)
  LDI r2, 8
  LDI r1, 0xFFB
  LOAD r1, r1
  AND r1, r2
  CMP r1, r2
  JNZ r1, move_right

  ; Enter key (bit 5) to place mark
  LDI r2, 32
  LDI r1, 0xFFB
  LOAD r1, r1
  AND r1, r2
  CMP r1, r2
  JNZ r1, place_mark

  JMP process_done

move_up:
  LOAD r0, CURSOR
  LDI r1, 3
  CMP r0, r1      ; if cursor >= 3, can move up
  BLT r0, cursor_too_far_up
  SUB r0, r0, r1  ; cursor -= 3
  STORE CURSOR, r0
cursor_too_far_up:
  JMP process_done

move_down:
  LOAD r0, CURSOR
  LDI r1, 6
  CMP r0, r1      ; if cursor < 6, can move down
  BLT r0, cursor_can_move_down
  JMP process_done
cursor_can_move_down:
  LDI r1, 3
  ADD r0, r0, r1  ; cursor += 3
  STORE CURSOR, r0
  JMP process_done

move_left:
  LOAD r0, CURSOR
  LDI r1, 0
  LDI r2, 3
  CMP r0, r2
  JZ r0, is_col_0
  MOD r0, r0, r2  ; cursor % 3
  CMP r0, r1      ; if result == 0, at left edge
  JZ r0, process_done
  LOAD r0, CURSOR
  LDI r1, 1
  SUB r0, r0, r1  ; cursor--
  STORE CURSOR, r0
  JMP process_done
is_col_0:
  JMP process_done

move_right:
  LOAD r0, CURSOR
  LDI r1, 2
  LDI r2, 3
  MOD r0, r0, r2
  CMP r0, r1      ; if result == 2, at right edge
  JZ r0, process_done
  LOAD r0, CURSOR
  LDI r1, 1
  ADD r0, r0, r1  ; cursor++
  STORE CURSOR, r0
  JMP process_done

place_mark:
  LOAD r0, CURSOR
  LDI r1, BOARD_ADDR
  ADD r1, r1, r0  ; r1 = &board[cursor]
  LOAD r2, r1     ; r2 = board[cursor]
  LDI r1, 0
  CMP r2, r1      ; if cell is not empty, can't place
  JNZ r0, process_done

  ; Place mark
  LOAD r0, CURSOR
  LDI r1, BOARD_ADDR
  ADD r1, r1, r0
  LOAD r2, TURN_ADDR  ; get current turn
  STORE r1, r2         ; board[cursor] = turn

  ; Check for win
  CALL check_win
  LOAD r1, GAME_STATE
  LDI r2, 1
  CMP r1, r2        ; if X wins
  BLT r0, turn_end
  LDI r2, 2
  CMP r1, r2        ; if O wins
  BLT r0, turn_end

  ; Check for draw
  CALL check_draw
  LOAD r1, GAME_STATE
  LDI r2, 3
  CMP r1, r2        ; if draw
  BLT r0, turn_end

  ; Switch turn
  LOAD r2, TURN_ADDR
  LDI r1, 1
  CMP r2, r1        ; if turn == 1 (X), switch to 2 (O)
  JZ r0, switch_to_o
  LDI r2, 1        ; else switch to 1 (X)
  STORE TURN_ADDR, r2
  JMP turn_end
switch_to_o:
  LDI r2, 2
  STORE TURN_ADDR, r2
turn_end:
  JMP process_done

process_done:
  RET

; Check for win - sets GAME_STATE if win found
check_win:
  LDI r0, 0        ; win_comb index
  LDI r1, 8        ; 8 win combinations
check_win_loop:
  ; Get first cell of combination
  LDI r2, WIN_COMBS
  ADD r2, r2, r0
  LOAD r3, r2      ; r3 = cell index
  LDI r2, BOARD_ADDR
  ADD r2, r2, r3
  LOAD r3, r2      ; r3 = board[cell]

  ; If empty, can't be a win
  LDI r2, 0
  CMP r3, r2
  JZ r0, next_comb

  ; Get second cell
  LDI r2, WIN_COMBS
  ADD r2, r2, r0
  ADD r2, r2, 1
  LOAD r4, r2      ; r4 = cell index 2
  LDI r2, BOARD_ADDR
  ADD r2, r2, r4
  LOAD r4, r2      ; r4 = board[cell2]

  ; Compare
  CMP r3, r4
  JZ r0, next_comb  ; if not equal, check next comb

  ; Get third cell
  LDI r2, WIN_COMBS
  ADD r2, r2, r0
  ADD r2, r2, 2
  LOAD r5, r2      ; r5 = cell index 3
  LDI r2, BOARD_ADDR
  ADD r2, r2, r5
  LOAD r5, r2      ; r5 = board[cell3]

  ; Compare
  CMP r3, r5
  JZ r0, next_comb  ; if not equal, check next comb

  ; All three match - we have a winner!
  ; r3 holds the winner (1=X, 2=O)
  STORE GAME_STATE, r3
  RET

next_comb:
  ADD r0, r0, 3
  CMP r0, r1
  BLT r0, check_win_loop
  RET

; Check for draw - all cells filled, no winner
check_draw:
  LDI r0, 0
  LDI r1, 9
check_draw_loop:
  LDI r2, BOARD_ADDR
  ADD r2, r2, r0
  LOAD r2, r2      ; r2 = board[i]
  LDI r3, 0
  CMP r2, r3       ; if empty, not a draw
  JZ r0, draw_check_done
  ADD r0, r0, 1
  CMP r0, r1
  BLT r0, check_draw_loop

  ; All cells filled - it's a draw
  LDI r0, 3
  STORE GAME_STATE, r0
draw_check_done:
  RET

; Render the game
render_game:
  ; Clear screen
  LDI r0, COLOR_BG
  FILL r0

  ; Draw grid
  CALL draw_grid

  ; Draw X/O marks
  CALL draw_marks

  ; Draw cursor
  CALL draw_cursor

  ; Draw game state message
  CALL draw_game_state

  ; Draw controls hint
  CALL draw_controls
  RET

; Draw the 3x3 grid
draw_grid:
  ; Vertical lines
  ; Line 1: x=104, y=24 to x=104, y=232
  LDI r0, 104
  LDI r1, 24
  LDI r2, 104
  LDI r3, 232
  LDI r4, COLOR_GRID
  LINE r0, r1, r2, r3, r4

  ; Line 2: x=184, y=24 to x=184, y=232
  LDI r0, 184
  LDI r1, 24
  LDI r2, 184
  LDI r3, 232
  LINE r0, r1, r2, r3, r4

  ; Horizontal lines
  ; Line 3: x=24, y=104 to x=232, y=104
  LDI r0, 24
  LDI r1, 104
  LDI r2, 232
  LDI r3, 104
  LINE r0, r1, r2, r3, r4

  ; Line 4: x=24, y=184 to x=232, y=184
  LDI r0, 24
  LDI r1, 184
  LDI r2, 232
  LDI r3, 184
  LINE r0, r1, r2, r3, r4
  RET

; Draw X and O marks on the board
draw_marks:
  LDI r0, 0        ; cell index
  LDI r1, 9        ; 9 cells
draw_marks_loop:
  LDI r2, BOARD_ADDR
  ADD r2, r2, r0
  LOAD r2, r2      ; r2 = board[i]

  LDI r3, 0
  CMP r2, r3       ; if empty, skip
  JZ r0, next_mark

  LDI r3, 1
  CMP r2, r3       ; if X
  JZ r0, draw_x

  LDI r3, 2
  CMP r2, r3       ; if O
  JZ r0, draw_o

  JMP next_mark

draw_x:
  CALL get_cell_center
  ; Draw X with two lines crossing
  ; Line 1: top-left to bottom-right (20 pixels offset)
  LDI r5, 20
  SUB r3, r3, r5  ; x - 20
  SUB r4, r4, r5  ; y - 20
  LDI r5, 20
  ADD r0, r0, r5  ; x + 20
  ADD r1, r1, r5  ; y + 20
  LDI r5, COLOR_X
  LINE r3, r4, r0, r1, r5

  ; Line 2: top-right to bottom-left
  LDI r5, 20
  ADD r3, r3, r5  ; x + 20
  SUB r4, r4, r5  ; y - 20
  LDI r5, 20
  SUB r0, r0, r5  ; x - 20
  ADD r1, r1, r5  ; y + 20
  LDI r5, COLOR_X
  LINE r3, r4, r0, r1, r5
  JMP next_mark

draw_o:
  CALL get_cell_center
  ; Draw O as a circle with radius 20
  LDI r5, 20
  LDI r6, COLOR_O
  CIRCLE r3, r4, r5, r6
  JMP next_mark

next_mark:
  ADD r0, r0, 1
  CMP r0, r1
  BLT r0, draw_marks_loop
  RET

; Get cell center coordinates for cell in r0
; Returns x in r3, y in r4
get_cell_center:
  LDI r1, POS_TABLE
  SHLI r0, r0, 1   ; multiply by 2
  ADD r1, r1, r0
  LOAD r3, r1      ; r3 = x
  ADD r1, r1, 1
  LOAD r4, r1      ; r4 = y
  RET

; Draw cursor highlight around current cell
draw_cursor:
  LOAD r0, GAME_STATE
  LDI r1, 0
  CMP r0, r1       ; only draw cursor if game is playing
  JNZ r0, cursor_done

  LOAD r0, CURSOR
  CALL get_cell_center
  ; Draw a rectangle around the cell
  LDI r5, 35       ; half-cell size
  SUB r3, r3, r5   ; left
  SUB r4, r4, r5   ; top
  LDI r5, 70
  ADD r0, r3, r5   ; right = left + 70
  LDI r5, 70
  ADD r1, r4, r5   ; bottom = top + 70
  ; Note: RECTF fills, but we want outline
  ; Use 4 lines for outline
  LDI r5, COLOR_CURSOR

  ; Top line
  LOAD r2, r0      ; save right
  LDI r0, 0        ; temp
  ADD r0, r3, r0   ; use left as x0
  LDI r6, r4       ; y0
  LOAD r0, r2      ; restore right
  LDI r7, r6       ; y1 (same as y0)
  ; LINE syntax: LINE xr0, yr0, xr1, yr1, cr
  ; We need to rearrange registers
  MOV r2, r3       ; r2 = left
  MOV r3, r4       ; r3 = top
  MOV r4, r0       ; r4 = right
  MOV r0, r2       ; r0 = left
  MOV r1, r3       ; r1 = top
  MOV r2, r4       ; r2 = right
  MOV r3, r6       ; r3 = top (y1 same as y0)
  LDI r4, COLOR_CURSOR
  LINE r0, r1, r2, r3, r4

cursor_done:
  RET

; Draw game state message
draw_game_state:
  LOAD r0, GAME_STATE
  LDI r1, 0
  CMP r0, r1
  JZ r0, state_done

  LDI r1, 1
  CMP r0, r1
  JZ r0, show_x_wins

  LDI r1, 2
  CMP r0, r1
  JZ r0, show_o_wins

  LDI r1, 3
  CMP r0, r1
  JZ r0, show_draw

  JMP state_done

show_x_wins:
  ; Draw "X WINS!" at top of screen
  ; For now, draw a green box to indicate X wins
  LDI r0, 0
  LDI r1, 0
  LDI r2, 256
  LDI r3, 20
  LDI r4, COLOR_X
  RECTF r0, r1, r2, r3, r4
  JMP state_done

show_o_wins:
  ; Draw a red box to indicate O wins
  LDI r0, 0
  LDI r1, 0
  LDI r2, 256
  LDI r3, 20
  LDI r4, COLOR_O
  RECTF r0, r1, r2, r3, r4
  JMP state_done

show_draw:
  ; Draw a gray box to indicate draw
  LDI r0, 0
  LDI r1, 0
  LDI r2, 256
  LDI r3, 20
  LDI r4, 0x888888
  RECTF r0, r1, r2, r3, r4
  JMP state_done

state_done:
  RET

; Draw controls hint at bottom
draw_controls:
  ; Draw "Arrow keys to move, Enter to select, R to reset" text
  ; For now, just draw a placeholder
  LDI r0, 0
  LDI r1, 236
  LDI r2, 256
  LDI r3, 20
  LDI r4, 0x333333
  RECTF r0, r1, r2, r3, r4
  RET