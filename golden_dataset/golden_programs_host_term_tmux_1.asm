; DESCRIPTION: Display a object using color red at the screen.

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
;   r2  CMP/result
;   r8  constant 1
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
LDI r8, 1
LDI r30, 0xFD00

; Dark background
LDI r2, 0x0A0A0A
FILL r2

; Initialize all 4 tab metadata: PTY=0xFFFF (unused), rest=0
LDI r13, 0
init_tabs_loop:
    ; PTY handle = 0xFFFF (unused)
    LDI r20, TAB_META
    MOV r21, r13
    LDI r4, 32
    MUL r21, r4
    ADD r20, r21
    LDI r2, 0xFFFF
    STORE r20, r2

    ; CUR_COL = 0
    MOV r22, r20
    ADD r22, r8
    LDI r2, 0
    STORE r22, r2

    ; CUR_ROW = 0
    MOV r22, r20
    LDI r4, 2
    ADD r22, r4
    LDI r2, 0
    STORE r22, r2

    ; ANSI_STATE = 0
    MOV r22, r20
    LDI r4, 3
    ADD r22, r4
    LDI r2, 0
    STORE r22, r2

    ; CONNECTED = 0
    MOV r22, r20
    LDI r4, 4
    ADD r22, r4
    LDI r2, 0
    STORE r22, r2

    ; BLINK = 0
    MOV r22, r20
    LDI r4, 5
    ADD r22, r4
    LDI r2, 0
    STORE r22, r2

    ADD r13, r8
    CMPI r13, 4
    BLT r2, init_tabs_loop

; Clear all 4 tab text buffers to spaces
LDI r13, 0
clear_tabs_buf:
    ; Get buffer base for tab r13
    CALL get_tab_buf_base
    ; r20 = buffer base
    LDI r9, 32
    LDI r6, TAB_BUF_CELLS
    MOV r21, r20
    LDI r4, TAB_BUF_CELLS
    ADD r21, r4
ctb_loop:
    STORE r20, r9
    ADD r20, r8
    CMP r20, r21
    BLT r2, ctb_loop

    ADD r13, r8
    CMPI r13, 4
    BLT r2, clear_tabs_buf

; Empty cmd string for PTYOPEN
LDI r20, CMD_BUF
LDI r2, 0
STORE r20, r2

; Set active tab = 0
LDI r20, ACTIVE_TAB
LDI r2, 0
STORE r20, r2

; =========================================
; SPAWN INITIAL TAB (tab 0)
; =========================================
LDI r13, 0
CALL spawn_tab

; =========================================
; STARTUP DRAIN for tab 0
; =========================================
LDI r20, ACTIVE_TAB
LDI r2, 0
STORE r20, r2
LDI r28, 0

LDI r22, 0          ; frame counter
LDI r23, 40         ; max startup frames

startup_drain:
    LDI r13, 0
    CALL drain_tab
    CALL render_active_tab
    CALL draw_tab_bar
    FRAME
    ADD r22, r8
    CMPI r22, 40
    BLT r2, startup_drain

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r8, 1

    ; Drain ALL tabs (background buffering)
    LDI r13, 0
drain_all_loop:
    CALL drain_tab
    ADD r13, r8
    CMPI r13, 4
    BLT r2, drain_all_loop

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
    IKEY r12
    JZ r12, main_loop

    ; Check tab switch keys
    CALL check_tab_switch
    ; r2 = 1 if tab was switched (consumed the key)
    CMPI r2, 1
    JZ r2, main_loop

    ; Check Ctrl+Shift+T (new tab)
    CMPI r12, CS_T
    JNZ r2, check_close
    CALL open_new_tab
    JMP main_loop

check_close:
    ; Check Ctrl+Shift+W (close tab)
    CMPI r12, CS_W
    JNZ r2, send_to_pty
    CALL close_active_tab
    JMP main_loop

send_to_pty:
    ; Send key to active tab's PTY
    CALL translate_key
    CMPI r2, 0
    JZ r2, main_loop

    ; Get active tab's PTY handle
    LDI r20, ACTIVE_TAB
    LOAD r28, r20
    CALL get_tab_pty
    ; r20 = PTY handle
    ; Check if handle is valid
    LDI r4, 0xFFFF
    CMP r20, r4
    JZ r2, main_loop

    ; PTYWRITE handle, send_buf, len
    MOV r9, r20       ; handle
    LDI r4, SEND_BUF
    ; r2 = byte count from translate_key
    PTYWRITE r9, r4, r2
    JMP main_loop

; =========================================
; GET_TAB_BUF_BASE -- return buffer address for tab r13
; Returns: r20 = buffer base address
; Clobbers: r4
; =========================================
get_tab_buf_base:
    CMPI r13, 0
    JNZ r2, gtbb_t1
    LDI r20, TAB0_BUF
    RET
gtbb_t1:
    CMPI r13, 1
    JNZ r2, gtbb_t2
    LDI r20, TAB1_BUF
    RET
gtbb_t2:
    CMPI r13, 2
    JNZ r2, gtbb_t3
    LDI r20, TAB2_BUF
    RET
gtbb_t3:
    LDI r20, TAB3_BUF
    RET

; =========================================
; GET_TAB_META -- return metadata base for tab r13
; Returns: r20 = metadata base address
; Clobbers: r4
; =========================================
get_tab_meta:
    LDI r20, TAB_META
    MOV r4, r13
    LDI r21, 32
    MUL r4, r21
    ADD r20, r4
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
; Uses: CMD_BUF, r12, r13
; =========================================
spawn_tab:
    PUSH r31
    LDI r8, 1

    ; PTYOPEN cmd_addr, handle_reg
    LDI r12, CMD_BUF
    LDI r4, 10
    PTYOPEN r12, r4

    ; Check success
    CMPI r2, 0
    JNZ r2, st_fail

    ; Store handle in tab metadata
    CALL get_tab_meta
    ; r20 = meta base
    STORE r20, r4    ; store handle (r4 from PTYOPEN result)

    ; Mark connected
    MOV r22, r20
    LDI r4, 4
    ADD r22, r4
    LDI r2, 1
    STORE r22, r2

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
    LDI r8, 1

    ; Get PTY handle
    CALL get_tab_pty
    ; r20 = PTY handle

    ; Check if slot is in use
    LDI r4, 0xFFFF
    CMP r20, r4
    JZ r2, dt_skip

    ; PTYREAD handle, recv_buf, max_len
    MOV r9, r20
    LDI r4, RECV_BUF
    LDI r10, 512
    PTYREAD r9, r4, r10
    MOV r10, r2

    ; Check for closed
    LDI r4, 0xFFFFFFFF
    CMP r10, r4
    JNZ r2, dt_process

    ; Mark disconnected
    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 4
    ADD r22, r4
    LDI r2, 0
    STORE r22, r2
    JMP dt_skip

dt_process:
    ; Process each byte through ANSI state machine for this tab
    CMPI r10, 0
    JZ r2, dt_skip

    LDI r15, 0
dt_byte_loop:
    CMP r15, r10
    BGE r2, dt_skip

    LDI r20, RECV_BUF
    ADD r20, r15
    LOAD r12, r20
    CALL process_byte_tab
    ADD r15, r8
    JMP dt_byte_loop

dt_skip:
    POP r13
    POP r31
    RET

; =========================================
; PROCESS_BYTE_TAB -- process byte r12 for tab r13
; Uses tab-specific ANSI state and cursor
; =========================================
process_byte_tab:
    PUSH r31
    LDI r8, 1

    ; Load ANSI state for this tab
    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 3
    ADD r22, r4
    LOAD r11, r22

    ; State: NORMAL
    CMPI r11, ANS_NORMAL
    JNZ r2, pbt_check_esc

    CMPI r12, 27
    JNZ r2, pbt_normal_byte

    ; Saw ESC
    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 3
    ADD r22, r4
    LDI r2, ANS_ESC
    STORE r22, r2
    JMP pbt_ret

pbt_normal_byte:
    CALL append_byte_tab
    JMP pbt_ret

pbt_check_esc:
    CMPI r11, ANS_ESC
    JNZ r2, pbt_check_csi

    CMPI r12, 91
    JNZ r2, pbt_esc_other

    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 3
    ADD r22, r4
    LDI r2, ANS_CSI
    STORE r22, r2
    JMP pbt_ret

pbt_esc_other:
    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 3
    ADD r22, r4
    LDI r2, ANS_NORMAL
    STORE r22, r2
    JMP pbt_ret

pbt_check_csi:
    CMPI r11, ANS_CSI
    JNZ r2, pbt_reset

    ; CSI terminator
    CMPI r12, 64
    BLT r2, pbt_ret

    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 3
    ADD r22, r4
    LDI r2, ANS_NORMAL
    STORE r22, r2
    JMP pbt_ret

pbt_reset:
    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 3
    ADD r22, r4
    LDI r2, ANS_NORMAL
    STORE r22, r2

pbt_ret:
    POP r31
    RET

; =========================================
; APPEND_BYTE_TAB -- append r12 to tab r13's text buffer
; =========================================
append_byte_tab:
    PUSH r31
    LDI r8, 1

    ; Newline
    CMPI r12, 10
    JNZ r2, abt_check_cr
    CALL do_newline_tab
    JMP abt_ret

abt_check_cr:
    CMPI r12, 13
    JNZ r2, abt_check_print
    ; col = 0
    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 1
    ADD r22, r4
    LDI r2, 0
    STORE r22, r2
    JMP abt_ret

abt_check_print:
    CMPI r12, 32
    BLT r2, abt_ret
    CMPI r12, 127
    BGE r2, abt_ret

    ; buf[row*COLS + col] = r12
    CALL get_tab_meta
    ; r20 = meta base
    MOV r21, r20
    LDI r4, 2
    ADD r21, r4
    LOAD r14, r21     ; r14 = CUR_ROW
    LDI r5, COLS
    MUL r14, r5
    MOV r21, r20
    LDI r4, 1
    ADD r21, r4
    LOAD r2, r21     ; r2 = CUR_COL
    ADD r14, r2

    CALL get_tab_buf_base
    ADD r20, r14
    STORE r20, r12

    ; col++
    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 1
    ADD r22, r4
    LOAD r2, r22
    ADD r2, r8
    STORE r22, r2
    CMPI r2, COLS
    JNZ r2, abt_ret
    CALL do_newline_tab

abt_ret:
    POP r31
    RET

; =========================================
; DO_NEWLINE_TAB -- newline for tab r13
; =========================================
do_newline_tab:
    PUSH r31
    LDI r8, 1

    ; col = 0
    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 1
    ADD r22, r4
    LDI r2, 0
    STORE r22, r2

    ; row++
    MOV r22, r20
    LDI r4, 2
    ADD r22, r4
    LOAD r9, r22
    ADD r9, r8
    CMPI r9, ROWS
    BLT r2, dnt_store
    CALL scroll_up_tab
    LDI r9, 25       ; ROWS-1
dnt_store:
    ; Re-get meta (scroll_up_tab may have changed r20)
    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 2
    ADD r22, r4
    STORE r22, r9

    POP r31
    RET

; =========================================
; SCROLL_UP_TAB -- scroll text buffer for tab r13
; =========================================
scroll_up_tab:
    PUSH r31
    LDI r8, 1

    ; Shift rows 1..(ROWS-1) up to 0..(ROWS-2), clear last row
    PUSH r13
    LDI r0, 0
sut_loop:
    CMPI r0, 25     ; ROWS-1
    BGE r2, sut_clear

    ; src = BUF + (row+1)*COLS
    CALL get_tab_buf_base
    MOV r21, r0
    ADD r21, r8
    LDI r4, COLS
    MUL r21, r4
    ADD r20, r21     ; r20 = src

    ; dst = BUF + row*COLS
    CALL get_tab_buf_base
    MOV r22, r0
    LDI r4, COLS
    MUL r22, r4
    ADD r21, r22     ; r21 = dst

    ; Copy COLS cells
    LDI r3, 0
sut_copy:
    LOAD r2, r20
    STORE r21, r2
    ADD r20, r8
    ADD r21, r8
    ADD r3, r8
    CMPI r3, COLS
    BLT r2, sut_copy

    ADD r0, r8
    JMP sut_loop

sut_clear:
    ; Clear last row
    CALL get_tab_buf_base
    LDI r4, 25
    LDI r22, COLS
    MUL r4, r22
    ADD r20, r4
    LDI r9, 32
    LDI r7, 0
scut_loop:
    STORE r20, r9
    ADD r20, r8
    ADD r7, r8
    CMPI r7, COLS
    BLT r2, scut_loop

    POP r13
    POP r31
    RET

; =========================================
; CHECK_TAB_SWITCH -- check if r12 is a tab switch key
; Returns: r2 = 1 if handled, 0 if not
; =========================================
check_tab_switch:
    PUSH r31

    ; Ctrl+1 or Alt+1 -> tab 0
    CMPI r12, CTRL_1
    JZ r2, cts_tab0
    CMPI r12, ALT_1
    JZ r2, cts_tab0

    ; Ctrl+2 or Alt+2 -> tab 1
    CMPI r12, CTRL_2
    JZ r2, cts_tab1
    CMPI r12, ALT_2
    JZ r2, cts_tab1

    ; Ctrl+3 or Alt+3 -> tab 2
    CMPI r12, CTRL_3
    JZ r2, cts_tab2
    CMPI r12, ALT_3
    JZ r2, cts_tab2

    ; Ctrl+4 or Alt+4 -> tab 3
    CMPI r12, CTRL_4
    JZ r2, cts_tab3
    CMPI r12, ALT_4
    JZ r2, cts_tab3

    ; Not a tab switch
    LDI r2, 0
    JMP cts_ret

cts_tab0:
    LDI r2, 0
    CALL switch_to_tab
    LDI r2, 1
    JMP cts_ret
cts_tab1:
    LDI r2, 1
    CALL switch_to_tab
    LDI r2, 1
    JMP cts_ret
cts_tab2:
    LDI r2, 2
    CALL switch_to_tab
    LDI r2, 1
    JMP cts_ret
cts_tab3:
    LDI r2, 3
    CALL switch_to_tab
    LDI r2, 1

cts_ret:
    POP r31
    RET

; =========================================
; SWITCH_TO_TAB -- switch to tab r2
; Only switches if that tab has a PTY
; =========================================
switch_to_tab:
    PUSH r31
    LDI r8, 1

    ; Check if tab has a PTY
    MOV r13, r2
    CALL get_tab_pty
    ; r20 = PTY handle
    LDI r4, 0xFFFF
    CMP r20, r4
    JZ r2, st_skip

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
    LDI r8, 1

    ; Find first unused tab
    LDI r13, 0
ont_loop:
    CALL get_tab_pty
    LDI r4, 0xFFFF
    CMP r20, r4
    JZ r2, ont_found
    ADD r13, r8
    CMPI r13, 4
    BLT r2, ont_loop
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
    LDI r8, 1

    LDI r20, ACTIVE_TAB
    LOAD r13, r20

    ; Get PTY handle
    CALL get_tab_pty
    ; r20 = handle

    ; PTYCLOSE handle_reg
    ; We need the handle in a register for PTYCLOSE
    MOV r4, r20
    PTYCLOSE r4

    ; Clear tab metadata
    CALL get_tab_meta
    LDI r2, 0xFFFF
    STORE r20, r2      ; PTY = unused
    MOV r22, r20
    LDI r4, 4
    ADD r22, r4
    LDI r2, 0
    STORE r22, r2      ; CONNECTED = 0

    ; Find another active tab to switch to
    LDI r13, 0
cat_find:
    CMPI r13, 4
    BGE r2, cat_done
    CALL get_tab_pty
    LDI r4, 0xFFFF
    CMP r20, r4
    JNZ r2, cat_switch
    ADD r13, r8
    JMP cat_find

cat_switch:
    LDI r20, ACTIVE_TAB
    STORE r20, r13

cat_done:
    POP r31
    RET

; =========================================
; TRANSLATE_KEY -- translate IKEY code to PTY byte(s)
; Fills SEND_BUF, returns byte count in r2
; r12 = raw IKEY value
; =========================================
translate_key:
    PUSH r31
    LDI r8, 1

    ; Printable ASCII (32-126)
    CMPI r12, 32
    BLT r2, tk_special
    CMPI r12, 127
    BGE r2, tk_special
    LDI r20, SEND_BUF
    STORE r20, r12
    LDI r2, 1
    JMP tk_ret

tk_special:
    ; Enter (0x0D) -> \n (10)
    CMPI r12, 13
    JNZ r2, tk_bs
    LDI r20, SEND_BUF
    LDI r2, 10
    STORE r20, r2
    LDI r2, 1
    JMP tk_ret

tk_bs:
    ; Backspace (0x08) -> DEL (0x7F)
    CMPI r12, 8
    JNZ r2, tk_del
    LDI r20, SEND_BUF
    LDI r2, 127
    STORE r20, r2
    LDI r2, 1
    JMP tk_ret

tk_del:
    CMPI r12, 127
    JNZ r2, tk_tab
    LDI r20, SEND_BUF
    LDI r2, 127
    STORE r20, r2
    LDI r2, 1
    JMP tk_ret

tk_tab:
    CMPI r12, 9
    JNZ r2, tk_ctrl_c
    LDI r20, SEND_BUF
    LDI r2, 9
    STORE r20, r2
    LDI r2, 1
    JMP tk_ret

tk_ctrl_c:
    CMPI r12, 3
    JNZ r2, tk_ctrl_d
    LDI r20, SEND_BUF
    LDI r2, 3
    STORE r20, r2
    LDI r2, 1
    JMP tk_ret

tk_ctrl_d:
    CMPI r12, 4
    JNZ r2, tk_escape
    LDI r20, SEND_BUF
    LDI r2, 4
    STORE r20, r2
    LDI r2, 1
    JMP tk_ret

tk_escape:
    CMPI r12, 27
    JNZ r2, tk_arrow_up
    LDI r20, SEND_BUF
    LDI r2, 27
    STORE r20, r2
    LDI r2, 1
    JMP tk_ret

tk_arrow_up:
    CMPI r12, KEY_UP
    JNZ r2, tk_arrow_down
    LDI r20, SEND_BUF
    LDI r2, 27
    STORE r20, r2
    MOV r22, r20
    ADD r22, r8
    LDI r2, 91
    STORE r22, r2
    MOV r22, r20
    LDI r4, 2
    ADD r22, r4
    LDI r2, 65
    STORE r22, r2
    LDI r2, 3
    JMP tk_ret

tk_arrow_down:
    CMPI r12, KEY_DOWN
    JNZ r2, tk_arrow_right
    LDI r20, SEND_BUF
    LDI r2, 27
    STORE r20, r2
    MOV r22, r20
    ADD r22, r8
    LDI r2, 91
    STORE r22, r2
    MOV r22, r20
    LDI r4, 2
    ADD r22, r4
    LDI r2, 66
    STORE r22, r2
    LDI r2, 3
    JMP tk_ret

tk_arrow_right:
    CMPI r12, KEY_RIGHT
    JNZ r2, tk_arrow_left
    LDI r20, SEND_BUF
    LDI r2, 27
    STORE r20, r2
    MOV r22, r20
    ADD r22, r8
    LDI r2, 91
    STORE r22, r2
    MOV r22, r20
    LDI r4, 2
    ADD r22, r4
    LDI r2, 67
    STORE r22, r2
    LDI r2, 3
    JMP tk_ret

tk_arrow_left:
    CMPI r12, KEY_LEFT
    JNZ r2, tk_home
    LDI r20, SEND_BUF
    LDI r2, 27
    STORE r20, r2
    MOV r22, r20
    ADD r22, r8
    LDI r2, 91
    STORE r22, r2
    MOV r22, r20
    LDI r4, 2
    ADD r22, r4
    LDI r2, 68
    STORE r22, r2
    LDI r2, 3
    JMP tk_ret

tk_home:
    CMPI r12, KEY_HOME
    JNZ r2, tk_end
    LDI r20, SEND_BUF
    LDI r2, 27
    STORE r20, r2
    MOV r22, r20
    ADD r22, r8
    LDI r2, 91
    STORE r22, r2
    MOV r22, r20
    LDI r4, 2
    ADD r22, r4
    LDI r2, 72
    STORE r22, r2
    LDI r2, 3
    JMP tk_ret

tk_end:
    CMPI r12, KEY_END
    JNZ r2, tk_ignore
    LDI r20, SEND_BUF
    LDI r2, 27
    STORE r20, r2
    MOV r22, r20
    ADD r22, r8
    LDI r2, 91
    STORE r22, r2
    MOV r22, r20
    LDI r4, 2
    ADD r22, r4
    LDI r2, 70
    STORE r22, r2
    LDI r2, 3
    JMP tk_ret

tk_ignore:
    LDI r2, 0

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
    LDI r8, 1

    ; Tab bar background (10px tall at bottom)
    LDI r8, 0
    LDI r14, 246
    LDI r5, 256
    LDI r11, 10
    LDI r12, 0x1A1A2E
    RECTF r8, r14, r5, r11, r12

    ; Load active tab
    LDI r20, ACTIVE_TAB
    LOAD r28, r20

    ; Draw each tab
    LDI r13, 0
    LDI r0, 0       ; x position for tab label

dtb_loop:
    ; Check if tab is active
    MOV r1, r13
    LDI r20, ACTIVE_TAB
    LOAD r2, r20
    CMP r1, r2
    JZ r2, dtb_active

    ; Inactive tab colors
    LDI r7, 0x888888
    LDI r6, 0x1A1A2E
    JMP dtb_draw

dtb_active:
    LDI r7, 0xFFFFFF
    LDI r6, 0x333355

dtb_draw:
    ; Draw tab background (highlight box)
    ; x = r0, y = 246, w = 60, h = 8
    MOV r8, r0
    LDI r14, 247
    LDI r5, 58
    LDI r11, 8
    RECTF r8, r14, r5, r11, r6

    ; Build label in SCRATCH: "N:label"
    LDI r20, SCRATCH
    ; Tab number character: 49='1', 50='2', etc.
    LDI r2, 49
    ADD r2, r13
    STORE r20, r2
    ADD r20, r8
    LDI r2, 58     ; ':'
    STORE r20, r2
    ADD r20, r8

    ; Check if tab has PTY
    PUSH r13
    CALL get_tab_pty
    ; r20 = handle (but we need to re-derive meta...)
    ; Actually r20 is PTY handle from get_tab_pty
    LDI r4, 0xFFFF
    CMP r20, r4
    POP r13
    JZ r2, dtb_empty

    ; Check connected
    PUSH r13
    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 4
    ADD r22, r4
    LOAD r2, r22
    POP r13
    JZ r2, dtb_dead

    ; Label = "bash"
    LDI r20, SCRATCH
    LDI r4, 2
    ADD r20, r4
    STRO r20, "bash"
    JMP dtb_render

dtb_dead:
    LDI r20, SCRATCH
    LDI r4, 2
    ADD r20, r4
    STRO r20, "dead"
    JMP dtb_render

dtb_empty:
    LDI r20, SCRATCH
    LDI r4, 2
    ADD r20, r4
    STRO r20, "---"

dtb_render:
    ; Draw label with SMALLTEXT
    MOV r8, r0
    ADD r8, r8        ; x + 2
    LDI r14, 248
    LDI r5, SCRATCH
    SMALLTEXT r8, r14, r5, r7, r6

    ; Advance x position
    LDI r4, 62
    ADD r0, r4

    ADD r13, r8
    CMPI r13, 4
    BLT r2, dtb_loop

    ; Restore r8
    LDI r8, 1

    POP r31
    RET

; =========================================
; RENDER_ACTIVE_TAB -- render the active tab's text buffer
; =========================================
render_active_tab:
    PUSH r31
    LDI r8, 1

    ; Clear content area (y=0 to y=246)
    LDI r8, 0
    LDI r14, 0
    LDI r5, 256
    LDI r11, 246
    LDI r12, 0x0A0A0A
    RECTF r8, r14, r5, r11, r12

    ; Title bar background
    LDI r8, 0
    LDI r14, 0
    LDI r5, 256
    LDI r11, 10
    LDI r12, 0x1A1A2E
    RECTF r8, r14, r5, r11, r12

    ; Title: "tmux [tab N]"
    LDI r20, SCRATCH
    STRO r20, "tmux [tab "
    ; Find end
    LDI r13, 0
rat_find_end:
    LDI r4, SCRATCH
    ADD r4, r13
    LOAD r2, r4
    JZ r2, rat_append_num
    ADD r13, r8
    JMP rat_find_end

rat_append_num:
    LDI r20, ACTIVE_TAB
    LOAD r2, r20
    LDI r4, 49
    ADD r2, r4
    LDI r20, SCRATCH
    ADD r20, r13
    STORE r20, r2
    ADD r13, r8
    LDI r20, SCRATCH
    ADD r20, r13
    LDI r2, 93     ; ']'
    STORE r20, r2
    ADD r13, r8
    LDI r20, SCRATCH
    ADD r20, r13
    LDI r2, 0
    STORE r20, r2

    ; Draw title
    LDI r8, 2
    LDI r14, 1
    LDI r5, SCRATCH
    LDI r11, 0x44DD44
    LDI r12, 0x1A1A2E
    DRAWTEXT r8, r14, r5, r11, r12

    ; Render text buffer
    LDI r20, ACTIVE_TAB
    LOAD r13, r20

    CALL get_tab_buf_base
    MOV r1, r20      ; r1 = buf pointer
    LDI r0, 10       ; y position (start after title bar)
    LDI r8, 1
    LDI r3, 0  ; row counter

rat_row:
    ; Copy COLS chars to scratch for rendering
    LDI r16, SCRATCH
    LDI r17, 0
rat_copy_col:
    LOAD r9, r1
    STORE r16, r9
    ADD r1, r8
    ADD r16, r8
    ADD r17, r8
    CMPI r17, COLS
    BLT r2, rat_copy_col
    LDI r2, 0
    STORE r16, r2      ; null-terminate

    ; Render with SMALLTEXT
    LDI r8, 0
    LDI r3, SCRATCH
    LDI r7, 0xBBBBBB
    LDI r6, 0
    SMALLTEXT r8, r0, r3, r7, r6

    LDI r8, 1
    ; Advance y by 6
    ADD r0, r8
    ADD r0, r8
    ADD r0, r8
    ADD r0, r8
    ADD r0, r8
    ADD r0, r8

    ADD r3, r8
    CMPI r3, ROWS
    BLT r3, rat_row

    ; Cursor blink for active tab
    LDI r20, ACTIVE_TAB
    LOAD r13, r20
    CALL get_tab_meta
    ; Blink counter
    MOV r22, r20
    LDI r4, 5
    ADD r22, r4
    LOAD r2, r22
    ADD r2, r8
    STORE r22, r2
    LDI r4, 8
    AND r2, r4
    CMPI r2, 4
    BGE r2, cursor_skip

    ; Draw cursor
    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 1
    ADD r22, r4
    LOAD r2, r22     ; CUR_COL
    LDI r4, 3
    MUL r2, r4
    MOV r22, r20
    LDI r4, 2
    ADD r22, r4
    LOAD r14, r22     ; CUR_ROW
    LDI r4, 6
    MUL r14, r4
    LDI r4, 10
    ADD r14, r4       ; + title bar offset
    LDI r5, 2
    LDI r11, 5
    LDI r12, 0x44FF44
    RECTF r2, r14, r5, r11, r12

cursor_skip:
    LDI r8, 1
    POP r31
    RET
