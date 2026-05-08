; DESCRIPTION: This GeOS assembly code implements a Minesweeper game with an 8x8 grid and 10 mines. It initializes the game state, places mines randomly, calculates adjacent mine counts for each cell, handles user input (mouse clicks and keyboard toggles), and renders the game grid, status messages, and buttons within a loop that updates the display frame by frame. The game checks for win or lose conditions and provides visual feedback based on player actions.

; minesweeper.asm -- Minesweeper Game for Geometry OS
;
; Proves: RAND (mine placement), HITSET/HITQ (mouse clicks),
;         FRAME loop, RECTF (cell rendering), TEXT (numbers),
;         IKEY (flag mode toggle), DIV/MOD (cell from coords).
;
; Controls:
;   Click cell = reveal (or flag if flag mode on)
;   Press F = toggle flag mode
;   Click [NEW] = restart game
;
; Grid: 8x8, 10 mines, cell size 22x22 pixels
; Grid position: (36, 30) to (212, 206)
;
; NOTE: No colons in comments (assembler pitfall)
; NOTE: LDI takes immediate only -- use MOV for register-to-register
; NOTE: CMPI takes register + immediate -- use CMP for register vs register

; ── Constants ──────────────────────────────────────
#define GRID_X     36
#define GRID_Y     30
#define CELL       22
#define COLS       8
#define ROWS       8
#define NUM_MINES  10

; RAM Layout (safely above bytecode at 0x4000+):
#define MINE_GRID  0x4000
#define MINE_END   0x4100
#define REVEAL     0x4400
#define REVEAL_END 0x4500
#define ADJ        0x4800
#define ADJ_END    0x4900
#define STATE      0x4C00
#define FLAG_MODE  0x4C04
#define MINE_LEFT  0x4C08
#define STR_BUF    0x4D00
#define SCRATCH    0x4E00

; ── INIT ──────────────────────────────────────
start:
    LDI r13, 1
    LDI r30, 0xFD00

    ; Clear mine grid (256 words)
    LDI r20, MINE_GRID
    LDI r21, MINE_END
clr_mine:
    LDI r3, 0
    STORE r20, r3
    LDI r13, 1
    ADD r20, r13
    CMP r20, r21
    BLT r3, clr_mine

    ; Clear reveal grid (256 words)
    LDI r20, REVEAL
    LDI r21, REVEAL_END
clr_rev:
    LDI r3, 0
    STORE r20, r3
    LDI r13, 1
    ADD r20, r13
    CMP r20, r21
    BLT r3, clr_rev

    ; Clear adj grid (256 words)
    LDI r20, ADJ
    LDI r21, ADJ_END
clr_adj:
    LDI r3, 0
    STORE r20, r3
    LDI r13, 1
    ADD r20, r13
    CMP r20, r21
    BLT r3, clr_adj

    ; Place 10 mines using RAND
    LDI r20, 0
place_loop:
    CMPI r20, NUM_MINES
    BGE r3, place_done
    RAND r21
    LDI r22, 64
    MOD r21, r22
    ; Check if mine already at this index
    LDI r23, MINE_GRID
    ADD r23, r21
    LOAD r24, r23
    CMPI r24, 1
    JNZ r3, place_found
    JMP place_loop
place_found:
    LDI r13, 1
    STORE r23, r13
    ADD r20, r13
    JMP place_loop
place_done:

    ; Calculate adjacent mine counts for each cell
    LDI r20, 0
calc_row:
    CMPI r20, ROWS
    BGE r3, calc_done
    LDI r21, 0
calc_col:
    CMPI r21, COLS
    BGE r3, calc_next_row
    ; count = 0
    LDI r22, 0
    ; Check all 8 neighbors by unrolled offset approach
    ; For each direction (dr, dc) in {(-1,-1),(-1,0),(-1,1),(0,-1),(0,1),(1,-1),(1,0),(1,1)}
    ; We use dr loop -1, 0, 1 and dc loop -1, 0, 1 skipping (0,0)
    LDI r25, 0xFFFFFFFF
calc_dr:
    CMPI r25, 2
    BGE r3, calc_store
    LDI r26, 0xFFFFFFFF
calc_dc:
    CMPI r26, 2
    BGE r3, calc_dr_inc
    ; Skip center (0,0)
    CMPI r25, 0
    JNZ r3, calc_do_check
    CMPI r26, 0
    JZ r3, calc_dc_inc

calc_do_check:
    ; nr = row + dr, nc = col + dc
    PUSH r20
    PUSH r21
    PUSH r22
    MOV r27, r20
    ADD r27, r25
    MOV r28, r21
    ADD r28, r26
    ; Bounds check: nr must be 0..7, nc must be 0..7
    ; Check nr < 0 (signed negative)
    CMPI r27, 0
    BLT r3, calc_pop_check
    CMPI r27, COLS
    BGE r3, calc_pop_check
    CMPI r28, 0
    BLT r3, calc_pop_check
    CMPI r28, COLS
    BGE r3, calc_pop_check
    ; Compute index = nr * 8 + nc
    MOV r29, r27
    LDI r23, COLS
    MUL r29, r23
    ADD r29, r28
    ; Check if mine at this neighbor
    LDI r23, MINE_GRID
    ADD r23, r29
    LOAD r23, r23
    CMPI r23, 1
    JNZ r3, calc_pop_check
    ; It is a mine - increment count
    POP r22
    PUSH r22
    LDI r13, 1
    ADD r22, r13

calc_pop_check:
    POP r22
    POP r21
    POP r20
calc_dc_inc:
    LDI r13, 1
    ADD r26, r13
    JMP calc_dc
calc_dr_inc:
    LDI r13, 1
    ADD r25, r13
    JMP calc_dr

calc_store:
    ; Store adj count: adj[row*8 + col] = count
    PUSH r20
    PUSH r21
    MOV r23, r20
    LDI r24, COLS
    MUL r23, r24
    ADD r23, r21
    LDI r24, ADJ
    ADD r24, r23
    STORE r24, r22
    POP r21
    POP r20
    ; Next col
    LDI r13, 1
    ADD r21, r13
    JMP calc_col
calc_next_row:
    LDI r13, 1
    ADD r20, r13
    JMP calc_row
calc_done:

    ; Set game state
    LDI r20, STATE
    LDI r3, 0
    STORE r20, r3
    LDI r20, FLAG_MODE
    STORE r20, r3
    LDI r20, MINE_LEFT
    LDI r3, NUM_MINES
    STORE r20, r3

; ── MAIN LOOP ──────────────────────────────────
main_loop:
    ; Fill background dark navy
    LDI r14, 0x1A1A2E
    FILL r14

    ; Title bar
    LDI r13, 0
    LDI r9, 0
    LDI r4, 256
    LDI r7, 20
    LDI r14, 0x333355
    RECTF r13, r9, r4, r7, r14

    LDI r20, STR_BUF
    STRO r20, "MINESWEEPER"
    LDI r13, 1
    LDI r9, 6
    LDI r4, STR_BUF
    TEXT r13, r9, r4

    ; Draw 8x8 grid
    LDI r25, 0
draw_row:
    CMPI r25, ROWS
    BGE r3, draw_done
    LDI r26, 0
draw_col:
    CMPI r26, COLS
    BGE r3, draw_next_row
    ; Compute pixel position
    LDI r13, 1
    ; px = GRID_X + col * CELL
    MOV r20, r26
    LDI r21, CELL
    MUL r20, r21
    LDI r21, GRID_X
    ADD r21, r20
    ; py = GRID_Y + row * CELL
    MOV r20, r25
    LDI r22, CELL
    MUL r20, r22
    LDI r22, GRID_Y
    ADD r22, r20
    ; Compute cell index = row * 8 + col
    PUSH r25
    PUSH r26
    MOV r20, r25
    LDI r23, COLS
    MUL r20, r23
    ADD r20, r26

    ; Load reveal state
    LDI r23, REVEAL
    ADD r23, r20
    LOAD r24, r23

    ; Draw based on state: 0=hidden, 1=revealed, 2=flagged
    CMPI r24, 2
    JNZ r3, draw_check_revealed
    ; Flagged - orange
    LDI r4, CELL
    LDI r7, CELL
    LDI r14, 0xFF8800
    RECTF r21, r22, r4, r7, r14
    JMP draw_next_cell

draw_check_revealed:
    CMPI r24, 1
    JNZ r3, draw_hidden
    ; Revealed - light
    LDI r4, CELL
    LDI r7, CELL
    LDI r14, 0xCCCCDD
    RECTF r21, r22, r4, r7, r14
    ; Draw number if adj > 0
    LDI r23, ADJ
    ADD r23, r20
    LOAD r24, r23
    CMPI r24, 0
    JZ r3, draw_next_cell
    ; Convert count to ASCII
    LDI r14, 48
    ADD r14, r24
    LDI r23, SCRATCH
    STORE r23, r14
    LDI r14, 0
    LDI r13, 1
    ADD r23, r13
    STORE r23, r14
    ; Center text in cell (x+7, y+7)
    LDI r13, 7
    ADD r21, r13
    ADD r22, r13
    LDI r4, SCRATCH
    TEXT r21, r22, r4
    JMP draw_next_cell

draw_hidden:
    ; Hidden - gray
    LDI r4, CELL
    LDI r7, CELL
    LDI r14, 0x555577
    RECTF r21, r22, r4, r7, r14

draw_next_cell:
    POP r26
    POP r25
    LDI r13, 1
    ADD r26, r13
    JMP draw_col
draw_next_row:
    LDI r13, 1
    ADD r25, r13
    JMP draw_row
draw_done:

    ; If game over, show mines in red
    LDI r20, STATE
    LOAD r20, r20
    CMPI r20, 2
    JNZ r3, draw_status
    LDI r25, 0
show_mines_row:
    CMPI r25, ROWS
    BGE r3, show_mines_done
    LDI r26, 0
show_mines_col:
    CMPI r26, COLS
    BGE r3, show_mines_nrow
    PUSH r25
    PUSH r26
    MOV r20, r25
    LDI r21, COLS
    MUL r20, r21
    ADD r20, r26
    LDI r23, MINE_GRID
    ADD r23, r20
    LOAD r24, r23
    CMPI r24, 1
    JNZ r3, show_mines_next
    ; Draw red over mine
    MOV r20, r26
    LDI r21, CELL
    MUL r20, r21
    LDI r21, GRID_X
    ADD r21, r20
    MOV r20, r25
    LDI r22, CELL
    MUL r20, r22
    LDI r22, GRID_Y
    ADD r22, r20
    LDI r4, CELL
    LDI r7, CELL
    LDI r14, 0xFF0000
    RECTF r21, r22, r4, r7, r14
show_mines_next:
    POP r26
    POP r25
    LDI r13, 1
    ADD r26, r13
    JMP show_mines_col
show_mines_nrow:
    LDI r13, 1
    ADD r25, r13
    JMP show_mines_row
show_mines_done:

draw_status:
    ; Mines remaining display
    LDI r20, MINE_LEFT
    LOAD r20, r20
    LDI r14, 48
    ADD r14, r20
    LDI r21, SCRATCH
    STORE r21, r14
    LDI r14, 0
    LDI r13, 1
    ADD r21, r13
    STORE r21, r14
    LDI r20, STR_BUF
    STRO r20, "Mines:"
    LDI r13, 8
    LDI r9, 214
    LDI r4, STR_BUF
    TEXT r13, r9, r4
    LDI r13, 52
    LDI r9, 214
    LDI r4, SCRATCH
    TEXT r13, r9, r4

    ; Flag mode display
    LDI r20, FLAG_MODE
    LOAD r20, r20
    CMPI r20, 1
    JNZ r3, show_dig
    LDI r20, STR_BUF
    STRO r20, "[FLAG]"
    LDI r13, 80
    LDI r9, 214
    LDI r4, STR_BUF
    TEXT r13, r9, r4
    JMP draw_new_btn
show_dig:
    LDI r20, STR_BUF
    STRO r20, "[DIG]"
    LDI r13, 80
    LDI r9, 214
    LDI r4, STR_BUF
    TEXT r13, r9, r4

draw_new_btn:
    ; NEW button
    LDI r13, 1
    LDI r14, 0x444466
    LDI r13, 170
    LDI r9, 232
    LDI r4, 60
    LDI r7, 16
    RECTF r13, r9, r4, r7, r14
    LDI r20, STR_BUF
    STRO r20, "[NEW]"
    LDI r13, 180
    LDI r9, 236
    LDI r4, STR_BUF
    TEXT r13, r9, r4

    ; Win/lose message
    LDI r20, STATE
    LOAD r20, r20
    CMPI r20, 1
    JNZ r3, check_lose
    LDI r20, STR_BUF
    STRO r20, "YOU WIN!"
    LDI r13, 80
    LDI r9, 228
    LDI r4, STR_BUF
    TEXT r13, r9, r4
    JMP do_frame
check_lose:
    CMPI r20, 2
    JNZ r3, do_frame
    LDI r20, STR_BUF
    STRO r20, "GAME OVER"
    LDI r13, 76
    LDI r9, 228
    LDI r4, STR_BUF
    TEXT r13, r9, r4

do_frame:
    ; Register hit regions
    LDI r13, 1
    LDI r14, GRID_X
    LDI r8, GRID_Y
    LDI r2, 176
    LDI r0, 176
    HITSET r14, r8, r2, r0, 1

    LDI r14, 170
    LDI r8, 232
    LDI r2, 60
    LDI r0, 16
    HITSET r14, r8, r2, r0, 2

    ; Render frame
    FRAME

    ; Check keyboard (F = toggle flag mode)
    IKEY r10
    CMPI r10, 70
    JNZ r3, do_hitq
    LDI r20, FLAG_MODE
    LOAD r21, r20
    LDI r13, 1
    XOR r21, r13
    STORE r20, r21

do_hitq:
    HITQ r10
    CMPI r10, 0
    JZ r3, main_loop

    ; Clicked NEW button
    CMPI r10, 2
    JZ r3, start

    ; Clicked grid - but only if playing
    LDI r20, STATE
    LOAD r20, r20
    CMPI r20, 0
    JNZ r3, main_loop

    ; Get mouse coords and compute cell
    MOUSEQ r12
    ; r12 = mouse_x, r5 = mouse_y
    LDI r15, GRID_X
    SUB r12, r15
    LDI r16, CELL
    DIV r12, r16
    LDI r15, GRID_Y
    SUB r5, r15
    LDI r16, CELL
    DIV r5, r16
    ; Bounds check
    CMPI r12, COLS
    BGE r3, main_loop
    CMPI r5, ROWS
    BGE r3, main_loop

    ; index = row * 8 + col
    PUSH r12
    PUSH r5
    MOV r20, r5
    LDI r21, COLS
    MUL r20, r21
    ADD r20, r12

    ; Check flag mode
    LDI r23, FLAG_MODE
    LOAD r23, r23
    CMPI r23, 0
    JNZ r3, do_flag

do_reveal:
    ; Skip if already revealed or flagged
    LDI r23, REVEAL
    ADD r23, r20
    LOAD r24, r23
    CMPI r24, 0
    JNZ r3, click_done

    ; Check if mine
    LDI r23, MINE_GRID
    ADD r23, r20
    LOAD r24, r23
    CMPI r24, 1
    JNZ r3, safe_reveal

    ; Hit mine - game over
    LDI r20, STATE
    LDI r13, 2
    STORE r20, r13
    JMP click_done

safe_reveal:
    ; Mark revealed
    LDI r23, REVEAL
    ADD r23, r20
    LDI r13, 1
    STORE r23, r13

    ; Simple flood fill for zero-adjacent cells
    ; Wave approach: repeat 8 times
    LDI r29, 8
flood_wave:
    CMPI r29, 0
    JZ r3, do_check_win
    LDI r13, 1
    SUB r29, r13
    ; Scan all cells
    LDI r25, 0
fw_row:
    CMPI r25, ROWS
    BGE r3, flood_next_wave
    LDI r26, 0
fw_col:
    CMPI r26, COLS
    BGE r3, fw_next_row
    PUSH r25
    PUSH r26
    MOV r20, r25
    LDI r21, COLS
    MUL r20, r21
    ADD r20, r26
    ; Check if revealed AND adj == 0
    LDI r23, REVEAL
    ADD r23, r20
    LOAD r24, r23
    CMPI r24, 1
    JNZ r3, fw_next
    LDI r23, ADJ
    ADD r23, r20
    LOAD r24, r23
    CMPI r24, 0
    JNZ r3, fw_next
    ; Reveal all 8 hidden neighbors
    LDI r27, 0xFFFFFFFF
fw_dr:
    CMPI r27, 2
    BGE r3, fw_next_pop
    LDI r28, 0xFFFFFFFF
fw_dc:
    CMPI r28, 2
    BGE r3, fw_dr_inc
    CMPI r27, 0
    JNZ r3, fw_do_nbr
    CMPI r28, 0
    JZ r3, fw_dc_inc
fw_do_nbr:
    ; nr = row + dr, nc = col + dc
    POP r24
    POP r23
    PUSH r23
    PUSH r24
    MOV r21, r23
    ADD r21, r27
    MOV r22, r24
    ADD r22, r28
    ; Bounds
    CMPI r21, 0
    BLT r3, fw_dc_inc
    CMPI r21, COLS
    BGE r3, fw_dc_inc
    CMPI r22, 0
    BLT r3, fw_dc_inc
    CMPI r22, COLS
    BGE r3, fw_dc_inc
    ; nidx = nr * 8 + nc
    PUSH r20
    MOV r20, r21
    LDI r24, COLS
    MUL r20, r24
    ADD r20, r22
    ; Check if hidden
    LDI r24, REVEAL
    ADD r24, r20
    LOAD r24, r24
    CMPI r24, 0
    JNZ r3, fw_dc_inc_pop
    ; Reveal it
    LDI r13, 1
    STORE r24, r13
fw_dc_inc_pop:
    POP r20
fw_dc_inc:
    LDI r13, 1
    ADD r28, r13
    JMP fw_dc
fw_dr_inc:
    LDI r13, 1
    ADD r27, r13
    JMP fw_dr
fw_next_pop:
    POP r26
    POP r25
    LDI r13, 1
    ADD r26, r13
    JMP fw_col
fw_next:
    POP r26
    POP r25
    LDI r13, 1
    ADD r26, r13
    JMP fw_col
fw_next_row:
    LDI r13, 1
    ADD r25, r13
    JMP fw_row
flood_next_wave:
    JMP flood_wave

do_check_win:
    ; Check if all non-mine cells revealed
    LDI r25, 0
win_row:
    CMPI r25, ROWS
    BGE r3, click_done
    LDI r26, 0
win_col:
    CMPI r26, COLS
    BGE r3, win_nrow
    PUSH r25
    PUSH r26
    MOV r20, r25
    LDI r21, COLS
    MUL r20, r21
    ADD r20, r26
    ; Skip mines
    LDI r23, MINE_GRID
    ADD r23, r20
    LOAD r24, r23
    CMPI r24, 1
    JZ r3, win_skip
    ; Must be revealed
    LDI r23, REVEAL
    ADD r23, r20
    LOAD r24, r23
    CMPI r24, 1
    JNZ r3, not_won
win_skip:
    POP r26
    POP r25
    LDI r13, 1
    ADD r26, r13
    JMP win_col
win_nrow:
    LDI r13, 1
    ADD r25, r13
    JMP win_row

not_won:
    POP r26
    POP r25
    JMP click_done

    ; All non-mine cells revealed - win!
    POP r26
    POP r25
    LDI r20, STATE
    LDI r13, 1
    STORE r20, r13

do_flag:
    ; Toggle flag on hidden cell
    LDI r23, REVEAL
    ADD r23, r20
    LOAD r24, r23
    CMPI r24, 0
    JNZ r3, click_done
    LDI r13, 2
    STORE r23, r13
    ; Decrement mines left
    LDI r23, MINE_LEFT
    LOAD r24, r23
    LDI r13, 1
    SUB r24, r13
    STORE r23, r24

click_done:
    POP r5
    POP r12
    JMP main_loop

    HALT
