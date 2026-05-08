; DESCRIPTION: This GeOS assembly code implements a multi-tab terminal interface similar to tmux. It manages up to four tabs, each running an independent bash process in a pseudo-terminal (PTY). The system uses shared memory buffers for input and output handling, processes ANSI escape sequences for text formatting, and provides functionality to switch between tabs using specific key combinations.

; host_term_tmux.asm -- Multi-tab Terminal (tmux-like) for Geometry OS
;
; Spawns bash inside real PTYs via PTYOPEN. Up to 4 tabs, each with its own
; bash process. Ctrl+1-4 or Alt+1-4 switches tabs. Ctrl+Shift+T opens new
; tab. Ctrl+Shift+W closes current tab. Background tabs buffer output.
;
; RAM Layout:
;   0x4000-0x47FF  RECV_BUF (2048 cells, shared)
;   0x4800-0x48FF  SEND_BUF (256 cells, shared)
;   0x4900-0x49FF  SCRATCH (256 cells, shared)
;   0x4A00         CMD_BUF (empty string for PTYOPEN)
;   0x4B00         ACTIVE_TAB (0-3)
;   0x4C00+tab*32  Tab metadata (16 words per tab):
;       +0: PTY handle (0xFFFF = unused)
;       +1: CUR_COL
;       +2: CUR_ROW
;       +3: ANSI_STATE
;       +4: CONNECTED
;       +5: BLINK
;   0x9000+tab*0x600  Tab text buffers (42*26 = 1092 cells each)
;
; Registers:
;   r11  CMP/result
;   r12  constant 1
;   r28 current tab index (live copy)
;   r30 stack pointer

#define COLS 42
#define ROWS 26
#define TAB_BUF_CELLS 1092

#define RECV_BUF 0x4000
#define SEND_BUF 0x4800
#define SCRATCH  0x4900
#define CMD_BUF  0x4A00
#define ACTIVE_TAB 0x4B00
#define TAB_META 0x4C00

; Tab buffer base addresses (each 0x600 apart)
#define TAB0_BUF 0x9000
#define TAB1_BUF 0x9600
#define TAB2_BUF 0x9C00
#define TAB3_BUF 0xA200

; Tab metadata offsets
#define T_PTY   0
#define T_COL   1
#define T_ROW   2
#define T_ANSI  3
#define T_CONN  4
#define T_BLINK 5

; ANSI states
#define ANS_NORMAL 0
#define ANS_ESC    1
#define ANS_CSI    2
#define ANS_OSC    3

; Extended key codes
#define KEY_UP    0x80
#define KEY_DOWN  0x81
#define KEY_LEFT  0x82
#define KEY_RIGHT 0x83
#define KEY_HOME  0x84
#define KEY_END   0x85

; Tab switch codes (Ctrl+1-4)
#define CTRL_1 0x92
#define CTRL_2 0x93
#define CTRL_3 0x94
#define CTRL_4 0x95
; Tab switch codes (Alt+1-4)
#define ALT_1 0xA0
#define ALT_2 0xA1
#define ALT_3 0xA2
#define ALT_4 0xA3
; Ctrl+Shift+T/W
#define CS_T 0x90
#define CS_W 0x91

; =========================================
; INIT
; =========================================
LDI r12, 1
LDI r30, 0xFD00

; Dark background
LDI r11, 0x0A0A0A
FILL r11

; Initialize all 4 tab metadata: PTY=0xFFFF (unused), rest=0
LDI r13, 0
init_tabs_loop:
    ; PTY handle = 0xFFFF (unused)
    LDI r20, TAB_META
    MOV r21, r13
    LDI r9, 32
    MUL r21, r9
    ADD r20, r21
    LDI r11, 0xFFFF
    STORE r20, r11

    ; CUR_COL = 0
    MOV r22, r20
    ADD r22, r12
    LDI r11, 0
    STORE r22, r11

    ; CUR_ROW = 0
    MOV r22, r20
    LDI r9, 2
    ADD r22, r9
    LDI r11, 0
    STORE r22, r11

    ; ANSI_STATE = 0
    MOV r22, r20
    LDI r9, 3
    ADD r22, r9
    LDI r11, 0
    STORE r22, r11

    ; CONNECTED = 0
    MOV r22, r20
    LDI r9, 4
    ADD r22, r9
    LDI r11, 0
    STORE r22, r11

    ; BLINK = 0
    MOV r22, r20
    LDI r9, 5
    ADD r22, r9
    LDI r11, 0
    STORE r22, r11

    ADD r13, r12
    CMPI r13, 4
    BLT r11, init_tabs_loop

; Clear all 4 tab text buffers to spaces
LDI r13, 0
clear_tabs_buf:
    ; Get buffer base for tab r13
    CALL get_tab_buf_base
    ; r20 = buffer base
    LDI r14, 32
    LDI r0, TAB_BUF_CELLS
    MOV r21, r20
    LDI r9, TAB_BUF_CELLS
    ADD r21, r9
ctb_loop:
    STORE r20, r14
    ADD r20, r12
    CMP r20, r21
    BLT r11, ctb_loop

    ADD r13, r12
    CMPI r13, 4
    BLT r11, clear_tabs_buf

; Empty cmd string for PTYOPEN
LDI r20, CMD_BUF
LDI r11, 0
STORE r20, r11

; Set active tab = 0
LDI r20, ACTIVE_TAB
LDI r11, 0
STORE r20, r11

; =========================================
; SPAWN INITIAL TAB (tab 0)
; =========================================
LDI r13, 0
CALL spawn_tab

; =========================================
; STARTUP DRAIN for tab 0
; =========================================
LDI r20, ACTIVE_TAB
LDI r11, 0
STORE r20, r11
LDI r28, 0

LDI r22, 0          ; frame counter
LDI r23, 40         ; max startup frames

startup_drain:
    LDI r13, 0
    CALL drain_tab
    CALL render_active_tab
    CALL draw_tab_bar
    FRAME
    ADD r22, r12
    CMPI r22, 40
    BLT r11, startup_drain

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r12, 1

    ; Drain ALL tabs (background buffering)
    LDI r13, 0
drain_all_loop:
    CALL drain_tab
    ADD r13, r12
    CMPI r13, 4
    BLT r11, drain_all_loop

    ; Load active tab
    LDI r20, ACTIVE_TAB
    LOAD r28, r20

    ; Render active tab
    CALL render_active_tab

    ; Draw tab bar
    CALL draw_tab_bar

    ; Frame
    FRAME

    ; Read keystroke
    IKEY r7
    JZ r7, main_loop

    ; Check tab switch keys
    CALL check_tab_switch
    ; r11 = 1 if tab was switched (consumed the key)
    CMPI r11, 1
    JZ r11, main_loop

    ; Check Ctrl+Shift+T (new tab)
    CMPI r7, CS_T
    JNZ r11, check_close
    CALL open_new_tab
    JMP main_loop

check_close:
    ; Check Ctrl+Shift+W (close tab)
    CMPI r7, CS_W
    JNZ r11, send_to_pty
    CALL close_active_tab
    JMP main_loop

send_to_pty:
    ; Send key to active tab's PTY
    CALL translate_key
    CMPI r11, 0
    JZ r11, main_loop

    ; Get active tab's PTY handle
    LDI r20, ACTIVE_TAB
    LOAD r28, r20
    CALL get_tab_pty
    ; r20 = PTY handle
    ; Check if handle is valid
    LDI r9, 0xFFFF
    CMP r20, r9
    JZ r11, main_loop

    ; PTYWRITE handle, send_buf, len
    MOV r14, r20       ; handle
    LDI r9, SEND_BUF
    ; r11 = byte count from translate_key
    PTYWRITE r14, r9, r11
    JMP main_loop

; =========================================
; GET_TAB_BUF_BASE -- return buffer address for tab r13
; Returns: r20 = buffer base address
; Clobbers: r9
; =========================================
get_tab_buf_base:
    CMPI r13, 0
    JNZ r11, gtbb_t1
    LDI r20, TAB0_BUF
    RET
gtbb_t1:
    CMPI r13, 1
    JNZ r11, gtbb_t2
    LDI r20, TAB1_BUF
    RET
gtbb_t2:
    CMPI r13, 2
    JNZ r11, gtbb_t3
    LDI r20, TAB2_BUF
    RET
gtbb_t3:
    LDI r20, TAB3_BUF
    RET

; =========================================
; GET_TAB_META -- return metadata base for tab r13
; Returns: r20 = metadata base address
; Clobbers: r9
; =========================================
get_tab_meta:
    LDI r20, TAB_META
    MOV r9, r13
    LDI r21, 32
    MUL r9, r21
    ADD r20, r9
    RET

; =========================================
; GET_TAB_PTY -- get PTY handle for tab r13
; Returns: r20 = PTY handle (0xFFFF if unused)
; =========================================
get_tab_pty:
    CALL get_tab_meta
    LOAD r20, r20
    RET

; =========================================
; SPAWN_TAB -- spawn bash in PTY for tab r13
; Uses: CMD_BUF, r7, r13
; =========================================
spawn_tab:
    PUSH r31
    LDI r12, 1

    ; PTYOPEN cmd_addr, handle_reg
    LDI r7, CMD_BUF
    LDI r9, 10
    PTYOPEN r7, r9

    ; Check success
    CMPI r11, 0
    JNZ r11, st_fail

    ; Store handle in tab metadata
    CALL get_tab_meta
    ; r20 = meta base
    STORE r20, r9    ; store handle (r9 from PTYOPEN result)

    ; Mark connected
    MOV r22, r20
    LDI r9, 4
    ADD r22, r9
    LDI r11, 1
    STORE r22, r11

    JMP st_done
st_fail:
    ; PTY open failed, leave handle as 0xFFFF
st_done:
    POP r31
    RET

; =========================================
; DRAIN_TAB -- read PTY output for tab r13, process through ANSI
; =========================================
drain_tab:
    PUSH r31
    PUSH r13
    LDI r12, 1

    ; Get PTY handle
    CALL get_tab_pty
    ; r20 = PTY handle

    ; Check if slot is in use
    LDI r9, 0xFFFF
    CMP r20, r9
    JZ r11, dt_skip

    ; PTYREAD handle, recv_buf, max_len
    MOV r14, r20
    LDI r9, RECV_BUF
    LDI r1, 512
    PTYREAD r14, r9, r1
    MOV r1, r11

    ; Check for closed
    LDI r9, 0xFFFFFFFF
    CMP r1, r9
    JNZ r11, dt_process

    ; Mark disconnected
    CALL get_tab_meta
    MOV r22, r20
    LDI r9, 4
    ADD r22, r9
    LDI r11, 0
    STORE r22, r11
    JMP dt_skip

dt_process:
    ; Process each byte through ANSI state machine for this tab
    CMPI r1, 0
    JZ r11, dt_skip

    LDI r5, 0
dt_byte_loop:
    CMP r5, r1
    BGE r11, dt_skip

    LDI r20, RECV_BUF
    ADD r20, r5
    LOAD r7, r20
    CALL process_byte_tab
    ADD r5, r12
    JMP dt_byte_loop

dt_skip:
    POP r13
    POP r31
    RET

; =========================================
; PROCESS_BYTE_TAB -- process byte r7 for tab r13
; Uses tab-specific ANSI state and cursor
; =========================================
process_byte_tab:
    PUSH r31
    LDI r12, 1

    ; Load ANSI state for this tab
    CALL get_tab_meta
    MOV r22, r20
    LDI r9, 3
    ADD r22, r9
    LOAD r10, r22

    ; State: NORMAL
    CMPI r10, ANS_NORMAL
    JNZ r11, pbt_check_esc

    CMPI r7, 27
    JNZ r11, pbt_normal_byte

    ; Saw ESC
    CALL get_tab_meta
    MOV r22, r20
    LDI r9, 3
    ADD r22, r9
    LDI r11, ANS_ESC
    STORE r22, r11
    JMP pbt_ret

pbt_normal_byte:
    CALL append_byte_tab
    JMP pbt_ret

pbt_check_esc:
    CMPI r10, ANS_ESC
    JNZ r11, pbt_check_csi

    CMPI r7, 91
    JNZ r11, pbt_esc_other

    CALL get_tab_meta
    MOV r22, r20
    LDI r9, 3
    ADD r22, r9
    LDI r11, ANS_CSI
    STORE r22, r11
    JMP pbt_ret

pbt_esc_other:
    CALL get_tab_meta
    MOV r22, r20
    LDI r9, 3
    ADD r22, r9
    LDI r11, ANS_NORMAL
    STORE r22, r11
    JMP pbt_ret

pbt_check_csi:
    CMPI r10, ANS_CSI
    JNZ r11, pbt_reset

    ; CSI terminator
    CMPI r7, 64
    BLT r11, pbt_ret

    CALL get_tab_meta
    MOV r22, r20
    LDI r9, 3
    ADD r22, r9
    LDI r11, ANS_NORMAL
    STORE r22, r11
    JMP pbt_ret

pbt_reset:
    CALL get_tab_meta
    MOV r22, r20
    LDI r9, 3
    ADD r22, r9
    LDI r11, ANS_NORMAL
    STORE r22, r11

pbt_ret:
    POP r31
    RET

; =========================================
; APPEND_BYTE_TAB -- append r7 to tab r13's text buffer
; =========================================
append_byte_tab:
    PUSH r31
    LDI r12, 1

    ; Newline
    CMPI r7, 10
    JNZ r11, abt_check_cr
    CALL do_newline_tab
    JMP abt_ret

abt_check_cr:
    CMPI r7, 13
    JNZ r11, abt_check_print
    ; col = 0
    CALL get_tab_meta
    MOV r22, r20
    LDI r9, 1
    ADD r22, r9
    LDI r11, 0
    STORE r22, r11
    JMP abt_ret

abt_check_print:
    CMPI r7, 32
    BLT r11, abt_ret
    CMPI r7, 127
    BGE r11, abt_ret

    ; buf[row*COLS + col] = r7
    CALL get_tab_meta
    ; r20 = meta base
    MOV r21, r20
    LDI r9, 2
    ADD r21, r9
    LOAD r8, r21     ; r8 = CUR_ROW
    LDI r3, COLS
    MUL r8, r3
    MOV r21, r20
    LDI r9, 1
    ADD r21, r9
    LOAD r11, r21     ; r11 = CUR_COL
    ADD r8, r11

    CALL get_tab_buf_base
    ADD r20, r8
    STORE r20, r7

    ; col++
    CALL get_tab_meta
    MOV r22, r20
    LDI r9, 1
    ADD r22, r9
    LOAD r11, r22
    ADD r11, r12
    STORE r22, r11
    CMPI r11, COLS
    JNZ r11, abt_ret
    CALL do_newline_tab

abt_ret:
    POP r31
    RET

; =========================================
; DO_NEWLINE_TAB -- newline for tab r13
; =========================================
do_newline_tab:
    PUSH r31
    LDI r12, 1

    ; col = 0
    CALL get_tab_meta
    MOV r22, r20
    LDI r9, 1
    ADD r22, r9
    LDI r11, 0
    STORE r22, r11

    ; row++
    MOV r22, r20
    LDI r9, 2
    ADD r22, r9
    LOAD r14, r22
    ADD r14, r12
    CMPI r14, ROWS
    BLT r11, dnt_store
    CALL scroll_up_tab
    LDI r14, 25       ; ROWS-1
dnt_store:
    ; Re-get meta (scroll_up_tab may have changed r20)
    CALL get_tab_meta
    MOV r22, r20
    LDI r9, 2
    ADD r22, r9
    STORE r22, r14

    POP r31
    RET

; =========================================
; SCROLL_UP_TAB -- scroll text buffer for tab r13
; =========================================
scroll_up_tab:
    PUSH r31
    LDI r12, 1

    ; Shift rows 1..(ROWS-1) up to 0..(ROWS-2), clear last row
    PUSH r13
    LDI r6, 0
sut_loop:
    CMPI r6, 25     ; ROWS-1
    BGE r11, sut_clear

    ; src = BUF + (row+1)*COLS
    CALL get_tab_buf_base
    MOV r21, r6
    ADD r21, r12
    LDI r9, COLS
    MUL r21, r9
    ADD r20, r21     ; r20 = src

    ; dst = BUF + row*COLS
    CALL get_tab_buf_base
    MOV r22, r6
    LDI r9, COLS
    MUL r22, r9
    ADD r21, r22     ; r21 = dst

    ; Copy COLS cells
    LDI r4, 0
sut_copy:
    LOAD r11, r20
    STORE r21, r11
    ADD r20, r12
    ADD r21, r12
    ADD r4, r12
    CMPI r4, COLS
    BLT r11, sut_copy

    ADD r6, r12
    JMP sut_loop

sut_clear:
    ; Clear last row
    CALL get_tab_buf_base
    LDI r9, 25
    LDI r22, COLS
    MUL r9, r22
    ADD r20, r9
    LDI r14, 32
    LDI r2, 0
scut_loop:
    STORE r20, r14
    ADD r20, r12
    ADD r2, r12
    CMPI r2, COLS
    BLT r11, scut_loop

    POP r13
    POP r31
    RET

; =========================================
; CHECK_TAB_SWITCH -- check if r7 is a tab switch key
; Returns: r11 = 1 if handled, 0 if not
; =========================================
check_tab_switch:
    PUSH r31

    ; Ctrl+1 or Alt+1 -> tab 0
    CMPI r7, CTRL_1
    JZ r11, cts_tab0
    CMPI r7, ALT_1
    JZ r11, cts_tab0

    ; Ctrl+2 or Alt+2 -> tab 1
    CMPI r7, CTRL_2
    JZ r11, cts_tab1
    CMPI r7, ALT_2
    JZ r11, cts_tab1

    ; Ctrl+3 or Alt+3 -> tab 2
    CMPI r7, CTRL_3
    JZ r11, cts_tab2
    CMPI r7, ALT_3
    JZ r11, cts_tab2

    ; Ctrl+4 or Alt+4 -> tab 3
    CMPI r7, CTRL_4
    JZ r11, cts_tab3
    CMPI r7, ALT_4
    JZ r11, cts_tab3

    ; Not a tab switch
    LDI r11, 0
    JMP cts_ret

cts_tab0:
    LDI r11, 0
    CALL switch_to_tab
    LDI r11, 1
    JMP cts_ret
cts_tab1:
    LDI r11, 1
    CALL switch_to_tab
    LDI r11, 1
    JMP cts_ret
cts_tab2:
    LDI r11, 2
    CALL switch_to_tab
    LDI r11, 1
    JMP cts_ret
cts_tab3:
    LDI r11, 3
    CALL switch_to_tab
    LDI r11, 1

cts_ret:
    POP r31
    RET

; =========================================
; SWITCH_TO_TAB -- switch to tab r11
; Only switches if that tab has a PTY
; =========================================
switch_to_tab:
    PUSH r31
    LDI r12, 1

    ; Check if tab has a PTY
    MOV r13, r11
    CALL get_tab_pty
    ; r20 = PTY handle
    LDI r9, 0xFFFF
    CMP r20, r9
    JZ r11, st_skip

    ; Switch
    LDI r20, ACTIVE_TAB
    STORE r20, r13

st_skip:
    POP r31
    RET

; =========================================
; OPEN_NEW_TAB -- find first free slot, spawn bash
; =========================================
open_new_tab:
    PUSH r31
    LDI r12, 1

    ; Find first unused tab
    LDI r13, 0
ont_loop:
    CALL get_tab_pty
    LDI r9, 0xFFFF
    CMP r20, r9
    JZ r11, ont_found
    ADD r13, r12
    CMPI r13, 4
    BLT r11, ont_loop
    ; All tabs full, skip
    JMP ont_done

ont_found:
    CALL spawn_tab
    ; Switch to new tab
    LDI r20, ACTIVE_TAB
    STORE r20, r13

ont_done:
    POP r31
    RET

; =========================================
; CLOSE_ACTIVE_TAB -- close current tab's PTY, switch to next
; =========================================
close_active_tab:
    PUSH r31
    LDI r12, 1

    LDI r20, ACTIVE_TAB
    LOAD r13, r20

    ; Get PTY handle
    CALL get_tab_pty
    ; r20 = handle

    ; PTYCLOSE handle_reg
    ; We need the handle in a register for PTYCLOSE
    MOV r9, r20
    PTYCLOSE r9

    ; Clear tab metadata
    CALL get_tab_meta
    LDI r11, 0xFFFF
    STORE r20, r11      ; PTY = unused
    MOV r22, r20
    LDI r9, 4
    ADD r22, r9
    LDI r11, 0
    STORE r22, r11      ; CONNECTED = 0

    ; Find another active tab to switch to
    LDI r13, 0
cat_find:
    CMPI r13, 4
    BGE r11, cat_done
    CALL get_tab_pty
    LDI r9, 0xFFFF
    CMP r20, r9
    JNZ r11, cat_switch
    ADD r13, r12
    JMP cat_find

cat_switch:
    LDI r20, ACTIVE_TAB
    STORE r20, r13

cat_done:
    POP r31
    RET

; =========================================
; TRANSLATE_KEY -- translate IKEY code to PTY byte(s)
; Fills SEND_BUF, returns byte count in r11
; r7 = raw IKEY value
; =========================================
translate_key:
    PUSH r31
    LDI r12, 1

    ; Printable ASCII (32-126)
    CMPI r7, 32
    BLT r11, tk_special
    CMPI r7, 127
    BGE r11, tk_special
    LDI r20, SEND_BUF
    STORE r20, r7
    LDI r11, 1
    JMP tk_ret

tk_special:
    ; Enter (0x0D) -> \n (10)
    CMPI r7, 13
    JNZ r11, tk_bs
    LDI r20, SEND_BUF
    LDI r11, 10
    STORE r20, r11
    LDI r11, 1
    JMP tk_ret

tk_bs:
    ; Backspace (0x08) -> DEL (0x7F)
    CMPI r7, 8
    JNZ r11, tk_del
    LDI r20, SEND_BUF
    LDI r11, 127
    STORE r20, r11
    LDI r11, 1
    JMP tk_ret

tk_del:
    CMPI r7, 127
    JNZ r11, tk_tab
    LDI r20, SEND_BUF
    LDI r11, 127
    STORE r20, r11
    LDI r11, 1
    JMP tk_ret

tk_tab:
    CMPI r7, 9
    JNZ r11, tk_ctrl_c
    LDI r20, SEND_BUF
    LDI r11, 9
    STORE r20, r11
    LDI r11, 1
    JMP tk_ret

tk_ctrl_c:
    CMPI r7, 3
    JNZ r11, tk_ctrl_d
    LDI r20, SEND_BUF
    LDI r11, 3
    STORE r20, r11
    LDI r11, 1
    JMP tk_ret

tk_ctrl_d:
    CMPI r7, 4
    JNZ r11, tk_escape
    LDI r20, SEND_BUF
    LDI r11, 4
    STORE r20, r11
    LDI r11, 1
    JMP tk_ret

tk_escape:
    CMPI r7, 27
    JNZ r11, tk_arrow_up
    LDI r20, SEND_BUF
    LDI r11, 27
    STORE r20, r11
    LDI r11, 1
    JMP tk_ret

tk_arrow_up:
    CMPI r7, KEY_UP
    JNZ r11, tk_arrow_down
    LDI r20, SEND_BUF
    LDI r11, 27
    STORE r20, r11
    MOV r22, r20
    ADD r22, r12
    LDI r11, 91
    STORE r22, r11
    MOV r22, r20
    LDI r9, 2
    ADD r22, r9
    LDI r11, 65
    STORE r22, r11
    LDI r11, 3
    JMP tk_ret

tk_arrow_down:
    CMPI r7, KEY_DOWN
    JNZ r11, tk_arrow_right
    LDI r20, SEND_BUF
    LDI r11, 27
    STORE r20, r11
    MOV r22, r20
    ADD r22, r12
    LDI r11, 91
    STORE r22, r11
    MOV r22, r20
    LDI r9, 2
    ADD r22, r9
    LDI r11, 66
    STORE r22, r11
    LDI r11, 3
    JMP tk_ret

tk_arrow_right:
    CMPI r7, KEY_RIGHT
    JNZ r11, tk_arrow_left
    LDI r20, SEND_BUF
    LDI r11, 27
    STORE r20, r11
    MOV r22, r20
    ADD r22, r12
    LDI r11, 91
    STORE r22, r11
    MOV r22, r20
    LDI r9, 2
    ADD r22, r9
    LDI r11, 67
    STORE r22, r11
    LDI r11, 3
    JMP tk_ret

tk_arrow_left:
    CMPI r7, KEY_LEFT
    JNZ r11, tk_home
    LDI r20, SEND_BUF
    LDI r11, 27
    STORE r20, r11
    MOV r22, r20
    ADD r22, r12
    LDI r11, 91
    STORE r22, r11
    MOV r22, r20
    LDI r9, 2
    ADD r22, r9
    LDI r11, 68
    STORE r22, r11
    LDI r11, 3
    JMP tk_ret

tk_home:
    CMPI r7, KEY_HOME
    JNZ r11, tk_end
    LDI r20, SEND_BUF
    LDI r11, 27
    STORE r20, r11
    MOV r22, r20
    ADD r22, r12
    LDI r11, 91
    STORE r22, r11
    MOV r22, r20
    LDI r9, 2
    ADD r22, r9
    LDI r11, 72
    STORE r22, r11
    LDI r11, 3
    JMP tk_ret

tk_end:
    CMPI r7, KEY_END
    JNZ r11, tk_ignore
    LDI r20, SEND_BUF
    LDI r11, 27
    STORE r20, r11
    MOV r22, r20
    ADD r22, r12
    LDI r11, 91
    STORE r22, r11
    MOV r22, r20
    LDI r9, 2
    ADD r22, r9
    LDI r11, 70
    STORE r22, r11
    LDI r11, 3
    JMP tk_ret

tk_ignore:
    LDI r11, 0

tk_ret:
    POP r31
    RET

; =========================================
; DRAW_TAB_BAR -- render tab bar at bottom of screen
; Shows: [1:bash] [2:bash] [3:---] [4:---]
; Active tab is highlighted
; =========================================
draw_tab_bar:
    PUSH r31
    LDI r12, 1

    ; Tab bar background (10px tall at bottom)
    LDI r12, 0
    LDI r8, 246
    LDI r3, 256
    LDI r10, 10
    LDI r7, 0x1A1A2E
    RECTF r12, r8, r3, r10, r7

    ; Load active tab
    LDI r20, ACTIVE_TAB
    LOAD r28, r20

    ; Draw each tab
    LDI r13, 0
    LDI r6, 0       ; x position for tab label

dtb_loop:
    ; Check if tab is active
    MOV r15, r13
    LDI r20, ACTIVE_TAB
    LOAD r11, r20
    CMP r15, r11
    JZ r11, dtb_active

    ; Inactive tab colors
    LDI r2, 0x888888
    LDI r0, 0x1A1A2E
    JMP dtb_draw

dtb_active:
    LDI r2, 0xFFFFFF
    LDI r0, 0x333355

dtb_draw:
    ; Draw tab background (highlight box)
    ; x = r6, y = 246, w = 60, h = 8
    MOV r12, r6
    LDI r8, 247
    LDI r3, 58
    LDI r10, 8
    RECTF r12, r8, r3, r10, r0

    ; Build label in SCRATCH: "N:label"
    LDI r20, SCRATCH
    ; Tab number character: 49='1', 50='2', etc.
    LDI r11, 49
    ADD r11, r13
    STORE r20, r11
    ADD r20, r12
    LDI r11, 58     ; ':'
    STORE r20, r11
    ADD r20, r12

    ; Check if tab has PTY
    PUSH r13
    CALL get_tab_pty
    ; r20 = handle (but we need to re-derive meta...)
    ; Actually r20 is PTY handle from get_tab_pty
    LDI r9, 0xFFFF
    CMP r20, r9
    POP r13
    JZ r11, dtb_empty

    ; Check connected
    PUSH r13
    CALL get_tab_meta
    MOV r22, r20
    LDI r9, 4
    ADD r22, r9
    LOAD r11, r22
    POP r13
    JZ r11, dtb_dead

    ; Label = "bash"
    LDI r20, SCRATCH
    LDI r9, 2
    ADD r20, r9
    STRO r20, "bash"
    JMP dtb_render

dtb_dead:
    LDI r20, SCRATCH
    LDI r9, 2
    ADD r20, r9
    STRO r20, "dead"
    JMP dtb_render

dtb_empty:
    LDI r20, SCRATCH
    LDI r9, 2
    ADD r20, r9
    STRO r20, "---"

dtb_render:
    ; Draw label with SMALLTEXT
    MOV r12, r6
    ADD r12, r12        ; x + 2
    LDI r8, 248
    LDI r3, SCRATCH
    SMALLTEXT r12, r8, r3, r2, r0

    ; Advance x position
    LDI r9, 62
    ADD r6, r9

    ADD r13, r12
    CMPI r13, 4
    BLT r11, dtb_loop

    ; Restore r12
    LDI r12, 1

    POP r31
    RET

; =========================================
; RENDER_ACTIVE_TAB -- render the active tab's text buffer
; =========================================
render_active_tab:
    PUSH r31
    LDI r12, 1

    ; Clear content area (y=0 to y=246)
    LDI r12, 0
    LDI r8, 0
    LDI r3, 256
    LDI r10, 246
    LDI r7, 0x0A0A0A
    RECTF r12, r8, r3, r10, r7

    ; Title bar background
    LDI r12, 0
    LDI r8, 0
    LDI r3, 256
    LDI r10, 10
    LDI r7, 0x1A1A2E
    RECTF r12, r8, r3, r10, r7

    ; Title: "tmux [tab N]"
    LDI r20, SCRATCH
    STRO r20, "tmux [tab "
    ; Find end
    LDI r13, 0
rat_find_end:
    LDI r9, SCRATCH
    ADD r9, r13
    LOAD r11, r9
    JZ r11, rat_append_num
    ADD r13, r12
    JMP rat_find_end

rat_append_num:
    LDI r20, ACTIVE_TAB
    LOAD r11, r20
    LDI r9, 49
    ADD r11, r9
    LDI r20, SCRATCH
    ADD r20, r13
    STORE r20, r11
    ADD r13, r12
    LDI r20, SCRATCH
    ADD r20, r13
    LDI r11, 93     ; ']'
    STORE r20, r11
    ADD r13, r12
    LDI r20, SCRATCH
    ADD r20, r13
    LDI r11, 0
    STORE r20, r11

    ; Draw title
    LDI r12, 2
    LDI r8, 1
    LDI r3, SCRATCH
    LDI r10, 0x44DD44
    LDI r7, 0x1A1A2E
    DRAWTEXT r12, r8, r3, r10, r7

    ; Render text buffer
    LDI r20, ACTIVE_TAB
    LOAD r13, r20

    CALL get_tab_buf_base
    MOV r15, r20      ; r15 = buf pointer
    LDI r6, 10       ; y position (start after title bar)
    LDI r12, 1
    LDI r4, 0  ; row counter

rat_row:
    ; Copy COLS chars to scratch for rendering
    LDI r16, SCRATCH
    LDI r17, 0
rat_copy_col:
    LOAD r14, r15
    STORE r16, r14
    ADD r15, r12
    ADD r16, r12
    ADD r17, r12
    CMPI r17, COLS
    BLT r11, rat_copy_col
    LDI r11, 0
    STORE r16, r11      ; null-terminate

    ; Render with SMALLTEXT
    LDI r12, 0
    LDI r4, SCRATCH
    LDI r2, 0xBBBBBB
    LDI r0, 0
    SMALLTEXT r12, r6, r4, r2, r0

    LDI r12, 1
    ; Advance y by 6
    ADD r6, r12
    ADD r6, r12
    ADD r6, r12
    ADD r6, r12
    ADD r6, r12
    ADD r6, r12

    ADD r4, r12
    CMPI r4, ROWS
    BLT r4, rat_row

    ; Cursor blink for active tab
    LDI r20, ACTIVE_TAB
    LOAD r13, r20
    CALL get_tab_meta
    ; Blink counter
    MOV r22, r20
    LDI r9, 5
    ADD r22, r9
    LOAD r11, r22
    ADD r11, r12
    STORE r22, r11
    LDI r9, 8
    AND r11, r9
    CMPI r11, 4
    BGE r11, cursor_skip

    ; Draw cursor
    CALL get_tab_meta
    MOV r22, r20
    LDI r9, 1
    ADD r22, r9
    LOAD r11, r22     ; CUR_COL
    LDI r9, 3
    MUL r11, r9
    MOV r22, r20
    LDI r9, 2
    ADD r22, r9
    LOAD r8, r22     ; CUR_ROW
    LDI r9, 6
    MUL r8, r9
    LDI r9, 10
    ADD r8, r9       ; + title bar offset
    LDI r3, 2
    LDI r10, 5
    LDI r7, 0x44FF44
    RECTF r11, r8, r3, r10, r7

cursor_skip:
    LDI r12, 1
    POP r31
    RET
