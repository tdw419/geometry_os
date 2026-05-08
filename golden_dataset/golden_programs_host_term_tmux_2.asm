; DESCRIPTION: Render a red object at the screen.

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
;   r1  CMP/result
;   r7  constant 1
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
LDI r7, 1
LDI r30, 0xFD00

; Dark background
LDI r1, 0x0A0A0A
FILL r1

; Initialize all 4 tab metadata: PTY=0xFFFF (unused), rest=0
LDI r12, 0
init_tabs_loop:
    ; PTY handle = 0xFFFF (unused)
    LDI r20, TAB_META
    MOV r21, r12
    LDI r4, 32
    MUL r21, r4
    ADD r20, r21
    LDI r1, 0xFFFF
    STORE r20, r1

    ; CUR_COL = 0
    MOV r22, r20
    ADD r22, r7
    LDI r1, 0
    STORE r22, r1

    ; CUR_ROW = 0
    MOV r22, r20
    LDI r4, 2
    ADD r22, r4
    LDI r1, 0
    STORE r22, r1

    ; ANSI_STATE = 0
    MOV r22, r20
    LDI r4, 3
    ADD r22, r4
    LDI r1, 0
    STORE r22, r1

    ; CONNECTED = 0
    MOV r22, r20
    LDI r4, 4
    ADD r22, r4
    LDI r1, 0
    STORE r22, r1

    ; BLINK = 0
    MOV r22, r20
    LDI r4, 5
    ADD r22, r4
    LDI r1, 0
    STORE r22, r1

    ADD r12, r7
    CMPI r12, 4
    BLT r1, init_tabs_loop

; Clear all 4 tab text buffers to spaces
LDI r12, 0
clear_tabs_buf:
    ; Get buffer base for tab r12
    CALL get_tab_buf_base
    ; r20 = buffer base
    LDI r5, 32
    LDI r3, TAB_BUF_CELLS
    MOV r21, r20
    LDI r4, TAB_BUF_CELLS
    ADD r21, r4
ctb_loop:
    STORE r20, r5
    ADD r20, r7
    CMP r20, r21
    BLT r1, ctb_loop

    ADD r12, r7
    CMPI r12, 4
    BLT r1, clear_tabs_buf

; Empty cmd string for PTYOPEN
LDI r20, CMD_BUF
LDI r1, 0
STORE r20, r1

; Set active tab = 0
LDI r20, ACTIVE_TAB
LDI r1, 0
STORE r20, r1

; =========================================
; SPAWN INITIAL TAB (tab 0)
; =========================================
LDI r12, 0
CALL spawn_tab

; =========================================
; STARTUP DRAIN for tab 0
; =========================================
LDI r20, ACTIVE_TAB
LDI r1, 0
STORE r20, r1
LDI r28, 0

LDI r22, 0          ; frame counter
LDI r23, 40         ; max startup frames

startup_drain:
    LDI r12, 0
    CALL drain_tab
    CALL render_active_tab
    CALL draw_tab_bar
    FRAME
    ADD r22, r7
    CMPI r22, 40
    BLT r1, startup_drain

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r7, 1

    ; Drain ALL tabs (background buffering)
    LDI r12, 0
drain_all_loop:
    CALL drain_tab
    ADD r12, r7
    CMPI r12, 4
    BLT r1, drain_all_loop

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
    IKEY r8
    JZ r8, main_loop

    ; Check tab switch keys
    CALL check_tab_switch
    ; r1 = 1 if tab was switched (consumed the key)
    CMPI r1, 1
    JZ r1, main_loop

    ; Check Ctrl+Shift+T (new tab)
    CMPI r8, CS_T
    JNZ r1, check_close
    CALL open_new_tab
    JMP main_loop

check_close:
    ; Check Ctrl+Shift+W (close tab)
    CMPI r8, CS_W
    JNZ r1, send_to_pty
    CALL close_active_tab
    JMP main_loop

send_to_pty:
    ; Send key to active tab's PTY
    CALL translate_key
    CMPI r1, 0
    JZ r1, main_loop

    ; Get active tab's PTY handle
    LDI r20, ACTIVE_TAB
    LOAD r28, r20
    CALL get_tab_pty
    ; r20 = PTY handle
    ; Check if handle is valid
    LDI r4, 0xFFFF
    CMP r20, r4
    JZ r1, main_loop

    ; PTYWRITE handle, send_buf, len
    MOV r5, r20       ; handle
    LDI r4, SEND_BUF
    ; r1 = byte count from translate_key
    PTYWRITE r5, r4, r1
    JMP main_loop

; =========================================
; GET_TAB_BUF_BASE -- return buffer address for tab r12
; Returns: r20 = buffer base address
; Clobbers: r4
; =========================================
get_tab_buf_base:
    CMPI r12, 0
    JNZ r1, gtbb_t1
    LDI r20, TAB0_BUF
    RET
gtbb_t1:
    CMPI r12, 1
    JNZ r1, gtbb_t2
    LDI r20, TAB1_BUF
    RET
gtbb_t2:
    CMPI r12, 2
    JNZ r1, gtbb_t3
    LDI r20, TAB2_BUF
    RET
gtbb_t3:
    LDI r20, TAB3_BUF
    RET

; =========================================
; GET_TAB_META -- return metadata base for tab r12
; Returns: r20 = metadata base address
; Clobbers: r4
; =========================================
get_tab_meta:
    LDI r20, TAB_META
    MOV r4, r12
    LDI r21, 32
    MUL r4, r21
    ADD r20, r4
    RET

; =========================================
; GET_TAB_PTY -- get PTY handle for tab r12
; Returns: r20 = PTY handle (0xFFFF if unused)
; =========================================
get_tab_pty:
    CALL get_tab_meta
    LOAD r20, r20
    RET

; =========================================
; SPAWN_TAB -- spawn bash in PTY for tab r12
; Uses: CMD_BUF, r8, r12
; =========================================
spawn_tab:
    PUSH r31
    LDI r7, 1

    ; PTYOPEN cmd_addr, handle_reg
    LDI r8, CMD_BUF
    LDI r4, 10
    PTYOPEN r8, r4

    ; Check success
    CMPI r1, 0
    JNZ r1, st_fail

    ; Store handle in tab metadata
    CALL get_tab_meta
    ; r20 = meta base
    STORE r20, r4    ; store handle (r4 from PTYOPEN result)

    ; Mark connected
    MOV r22, r20
    LDI r4, 4
    ADD r22, r4
    LDI r1, 1
    STORE r22, r1

    JMP st_done
st_fail:
    ; PTY open failed, leave handle as 0xFFFF
st_done:
    POP r31
    RET

; =========================================
; DRAIN_TAB -- read PTY output for tab r12, process through ANSI
; =========================================
drain_tab:
    PUSH r31
    PUSH r12
    LDI r7, 1

    ; Get PTY handle
    CALL get_tab_pty
    ; r20 = PTY handle

    ; Check if slot is in use
    LDI r4, 0xFFFF
    CMP r20, r4
    JZ r1, dt_skip

    ; PTYREAD handle, recv_buf, max_len
    MOV r5, r20
    LDI r4, RECV_BUF
    LDI r14, 512
    PTYREAD r5, r4, r14
    MOV r14, r1

    ; Check for closed
    LDI r4, 0xFFFFFFFF
    CMP r14, r4
    JNZ r1, dt_process

    ; Mark disconnected
    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 4
    ADD r22, r4
    LDI r1, 0
    STORE r22, r1
    JMP dt_skip

dt_process:
    ; Process each byte through ANSI state machine for this tab
    CMPI r14, 0
    JZ r1, dt_skip

    LDI r9, 0
dt_byte_loop:
    CMP r9, r14
    BGE r1, dt_skip

    LDI r20, RECV_BUF
    ADD r20, r9
    LOAD r8, r20
    CALL process_byte_tab
    ADD r9, r7
    JMP dt_byte_loop

dt_skip:
    POP r12
    POP r31
    RET

; =========================================
; PROCESS_BYTE_TAB -- process byte r8 for tab r12
; Uses tab-specific ANSI state and cursor
; =========================================
process_byte_tab:
    PUSH r31
    LDI r7, 1

    ; Load ANSI state for this tab
    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 3
    ADD r22, r4
    LOAD r13, r22

    ; State: NORMAL
    CMPI r13, ANS_NORMAL
    JNZ r1, pbt_check_esc

    CMPI r8, 27
    JNZ r1, pbt_normal_byte

    ; Saw ESC
    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 3
    ADD r22, r4
    LDI r1, ANS_ESC
    STORE r22, r1
    JMP pbt_ret

pbt_normal_byte:
    CALL append_byte_tab
    JMP pbt_ret

pbt_check_esc:
    CMPI r13, ANS_ESC
    JNZ r1, pbt_check_csi

    CMPI r8, 91
    JNZ r1, pbt_esc_other

    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 3
    ADD r22, r4
    LDI r1, ANS_CSI
    STORE r22, r1
    JMP pbt_ret

pbt_esc_other:
    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 3
    ADD r22, r4
    LDI r1, ANS_NORMAL
    STORE r22, r1
    JMP pbt_ret

pbt_check_csi:
    CMPI r13, ANS_CSI
    JNZ r1, pbt_reset

    ; CSI terminator
    CMPI r8, 64
    BLT r1, pbt_ret

    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 3
    ADD r22, r4
    LDI r1, ANS_NORMAL
    STORE r22, r1
    JMP pbt_ret

pbt_reset:
    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 3
    ADD r22, r4
    LDI r1, ANS_NORMAL
    STORE r22, r1

pbt_ret:
    POP r31
    RET

; =========================================
; APPEND_BYTE_TAB -- append r8 to tab r12's text buffer
; =========================================
append_byte_tab:
    PUSH r31
    LDI r7, 1

    ; Newline
    CMPI r8, 10
    JNZ r1, abt_check_cr
    CALL do_newline_tab
    JMP abt_ret

abt_check_cr:
    CMPI r8, 13
    JNZ r1, abt_check_print
    ; col = 0
    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 1
    ADD r22, r4
    LDI r1, 0
    STORE r22, r1
    JMP abt_ret

abt_check_print:
    CMPI r8, 32
    BLT r1, abt_ret
    CMPI r8, 127
    BGE r1, abt_ret

    ; buf[row*COLS + col] = r8
    CALL get_tab_meta
    ; r20 = meta base
    MOV r21, r20
    LDI r4, 2
    ADD r21, r4
    LOAD r0, r21     ; r0 = CUR_ROW
    LDI r11, COLS
    MUL r0, r11
    MOV r21, r20
    LDI r4, 1
    ADD r21, r4
    LOAD r1, r21     ; r1 = CUR_COL
    ADD r0, r1

    CALL get_tab_buf_base
    ADD r20, r0
    STORE r20, r8

    ; col++
    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 1
    ADD r22, r4
    LOAD r1, r22
    ADD r1, r7
    STORE r22, r1
    CMPI r1, COLS
    JNZ r1, abt_ret
    CALL do_newline_tab

abt_ret:
    POP r31
    RET

; =========================================
; DO_NEWLINE_TAB -- newline for tab r12
; =========================================
do_newline_tab:
    PUSH r31
    LDI r7, 1

    ; col = 0
    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 1
    ADD r22, r4
    LDI r1, 0
    STORE r22, r1

    ; row++
    MOV r22, r20
    LDI r4, 2
    ADD r22, r4
    LOAD r5, r22
    ADD r5, r7
    CMPI r5, ROWS
    BLT r1, dnt_store
    CALL scroll_up_tab
    LDI r5, 25       ; ROWS-1
dnt_store:
    ; Re-get meta (scroll_up_tab may have changed r20)
    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 2
    ADD r22, r4
    STORE r22, r5

    POP r31
    RET

; =========================================
; SCROLL_UP_TAB -- scroll text buffer for tab r12
; =========================================
scroll_up_tab:
    PUSH r31
    LDI r7, 1

    ; Shift rows 1..(ROWS-1) up to 0..(ROWS-2), clear last row
    PUSH r12
    LDI r6, 0
sut_loop:
    CMPI r6, 25     ; ROWS-1
    BGE r1, sut_clear

    ; src = BUF + (row+1)*COLS
    CALL get_tab_buf_base
    MOV r21, r6
    ADD r21, r7
    LDI r4, COLS
    MUL r21, r4
    ADD r20, r21     ; r20 = src

    ; dst = BUF + row*COLS
    CALL get_tab_buf_base
    MOV r22, r6
    LDI r4, COLS
    MUL r22, r4
    ADD r21, r22     ; r21 = dst

    ; Copy COLS cells
    LDI r2, 0
sut_copy:
    LOAD r1, r20
    STORE r21, r1
    ADD r20, r7
    ADD r21, r7
    ADD r2, r7
    CMPI r2, COLS
    BLT r1, sut_copy

    ADD r6, r7
    JMP sut_loop

sut_clear:
    ; Clear last row
    CALL get_tab_buf_base
    LDI r4, 25
    LDI r22, COLS
    MUL r4, r22
    ADD r20, r4
    LDI r5, 32
    LDI r10, 0
scut_loop:
    STORE r20, r5
    ADD r20, r7
    ADD r10, r7
    CMPI r10, COLS
    BLT r1, scut_loop

    POP r12
    POP r31
    RET

; =========================================
; CHECK_TAB_SWITCH -- check if r8 is a tab switch key
; Returns: r1 = 1 if handled, 0 if not
; =========================================
check_tab_switch:
    PUSH r31

    ; Ctrl+1 or Alt+1 -> tab 0
    CMPI r8, CTRL_1
    JZ r1, cts_tab0
    CMPI r8, ALT_1
    JZ r1, cts_tab0

    ; Ctrl+2 or Alt+2 -> tab 1
    CMPI r8, CTRL_2
    JZ r1, cts_tab1
    CMPI r8, ALT_2
    JZ r1, cts_tab1

    ; Ctrl+3 or Alt+3 -> tab 2
    CMPI r8, CTRL_3
    JZ r1, cts_tab2
    CMPI r8, ALT_3
    JZ r1, cts_tab2

    ; Ctrl+4 or Alt+4 -> tab 3
    CMPI r8, CTRL_4
    JZ r1, cts_tab3
    CMPI r8, ALT_4
    JZ r1, cts_tab3

    ; Not a tab switch
    LDI r1, 0
    JMP cts_ret

cts_tab0:
    LDI r1, 0
    CALL switch_to_tab
    LDI r1, 1
    JMP cts_ret
cts_tab1:
    LDI r1, 1
    CALL switch_to_tab
    LDI r1, 1
    JMP cts_ret
cts_tab2:
    LDI r1, 2
    CALL switch_to_tab
    LDI r1, 1
    JMP cts_ret
cts_tab3:
    LDI r1, 3
    CALL switch_to_tab
    LDI r1, 1

cts_ret:
    POP r31
    RET

; =========================================
; SWITCH_TO_TAB -- switch to tab r1
; Only switches if that tab has a PTY
; =========================================
switch_to_tab:
    PUSH r31
    LDI r7, 1

    ; Check if tab has a PTY
    MOV r12, r1
    CALL get_tab_pty
    ; r20 = PTY handle
    LDI r4, 0xFFFF
    CMP r20, r4
    JZ r1, st_skip

    ; Switch
    LDI r20, ACTIVE_TAB
    STORE r20, r12

st_skip:
    POP r31
    RET

; =========================================
; OPEN_NEW_TAB -- find first free slot, spawn bash
; =========================================
open_new_tab:
    PUSH r31
    LDI r7, 1

    ; Find first unused tab
    LDI r12, 0
ont_loop:
    CALL get_tab_pty
    LDI r4, 0xFFFF
    CMP r20, r4
    JZ r1, ont_found
    ADD r12, r7
    CMPI r12, 4
    BLT r1, ont_loop
    ; All tabs full, skip
    JMP ont_done

ont_found:
    CALL spawn_tab
    ; Switch to new tab
    LDI r20, ACTIVE_TAB
    STORE r20, r12

ont_done:
    POP r31
    RET

; =========================================
; CLOSE_ACTIVE_TAB -- close current tab's PTY, switch to next
; =========================================
close_active_tab:
    PUSH r31
    LDI r7, 1

    LDI r20, ACTIVE_TAB
    LOAD r12, r20

    ; Get PTY handle
    CALL get_tab_pty
    ; r20 = handle

    ; PTYCLOSE handle_reg
    ; We need the handle in a register for PTYCLOSE
    MOV r4, r20
    PTYCLOSE r4

    ; Clear tab metadata
    CALL get_tab_meta
    LDI r1, 0xFFFF
    STORE r20, r1      ; PTY = unused
    MOV r22, r20
    LDI r4, 4
    ADD r22, r4
    LDI r1, 0
    STORE r22, r1      ; CONNECTED = 0

    ; Find another active tab to switch to
    LDI r12, 0
cat_find:
    CMPI r12, 4
    BGE r1, cat_done
    CALL get_tab_pty
    LDI r4, 0xFFFF
    CMP r20, r4
    JNZ r1, cat_switch
    ADD r12, r7
    JMP cat_find

cat_switch:
    LDI r20, ACTIVE_TAB
    STORE r20, r12

cat_done:
    POP r31
    RET

; =========================================
; TRANSLATE_KEY -- translate IKEY code to PTY byte(s)
; Fills SEND_BUF, returns byte count in r1
; r8 = raw IKEY value
; =========================================
translate_key:
    PUSH r31
    LDI r7, 1

    ; Printable ASCII (32-126)
    CMPI r8, 32
    BLT r1, tk_special
    CMPI r8, 127
    BGE r1, tk_special
    LDI r20, SEND_BUF
    STORE r20, r8
    LDI r1, 1
    JMP tk_ret

tk_special:
    ; Enter (0x0D) -> \n (10)
    CMPI r8, 13
    JNZ r1, tk_bs
    LDI r20, SEND_BUF
    LDI r1, 10
    STORE r20, r1
    LDI r1, 1
    JMP tk_ret

tk_bs:
    ; Backspace (0x08) -> DEL (0x7F)
    CMPI r8, 8
    JNZ r1, tk_del
    LDI r20, SEND_BUF
    LDI r1, 127
    STORE r20, r1
    LDI r1, 1
    JMP tk_ret

tk_del:
    CMPI r8, 127
    JNZ r1, tk_tab
    LDI r20, SEND_BUF
    LDI r1, 127
    STORE r20, r1
    LDI r1, 1
    JMP tk_ret

tk_tab:
    CMPI r8, 9
    JNZ r1, tk_ctrl_c
    LDI r20, SEND_BUF
    LDI r1, 9
    STORE r20, r1
    LDI r1, 1
    JMP tk_ret

tk_ctrl_c:
    CMPI r8, 3
    JNZ r1, tk_ctrl_d
    LDI r20, SEND_BUF
    LDI r1, 3
    STORE r20, r1
    LDI r1, 1
    JMP tk_ret

tk_ctrl_d:
    CMPI r8, 4
    JNZ r1, tk_escape
    LDI r20, SEND_BUF
    LDI r1, 4
    STORE r20, r1
    LDI r1, 1
    JMP tk_ret

tk_escape:
    CMPI r8, 27
    JNZ r1, tk_arrow_up
    LDI r20, SEND_BUF
    LDI r1, 27
    STORE r20, r1
    LDI r1, 1
    JMP tk_ret

tk_arrow_up:
    CMPI r8, KEY_UP
    JNZ r1, tk_arrow_down
    LDI r20, SEND_BUF
    LDI r1, 27
    STORE r20, r1
    MOV r22, r20
    ADD r22, r7
    LDI r1, 91
    STORE r22, r1
    MOV r22, r20
    LDI r4, 2
    ADD r22, r4
    LDI r1, 65
    STORE r22, r1
    LDI r1, 3
    JMP tk_ret

tk_arrow_down:
    CMPI r8, KEY_DOWN
    JNZ r1, tk_arrow_right
    LDI r20, SEND_BUF
    LDI r1, 27
    STORE r20, r1
    MOV r22, r20
    ADD r22, r7
    LDI r1, 91
    STORE r22, r1
    MOV r22, r20
    LDI r4, 2
    ADD r22, r4
    LDI r1, 66
    STORE r22, r1
    LDI r1, 3
    JMP tk_ret

tk_arrow_right:
    CMPI r8, KEY_RIGHT
    JNZ r1, tk_arrow_left
    LDI r20, SEND_BUF
    LDI r1, 27
    STORE r20, r1
    MOV r22, r20
    ADD r22, r7
    LDI r1, 91
    STORE r22, r1
    MOV r22, r20
    LDI r4, 2
    ADD r22, r4
    LDI r1, 67
    STORE r22, r1
    LDI r1, 3
    JMP tk_ret

tk_arrow_left:
    CMPI r8, KEY_LEFT
    JNZ r1, tk_home
    LDI r20, SEND_BUF
    LDI r1, 27
    STORE r20, r1
    MOV r22, r20
    ADD r22, r7
    LDI r1, 91
    STORE r22, r1
    MOV r22, r20
    LDI r4, 2
    ADD r22, r4
    LDI r1, 68
    STORE r22, r1
    LDI r1, 3
    JMP tk_ret

tk_home:
    CMPI r8, KEY_HOME
    JNZ r1, tk_end
    LDI r20, SEND_BUF
    LDI r1, 27
    STORE r20, r1
    MOV r22, r20
    ADD r22, r7
    LDI r1, 91
    STORE r22, r1
    MOV r22, r20
    LDI r4, 2
    ADD r22, r4
    LDI r1, 72
    STORE r22, r1
    LDI r1, 3
    JMP tk_ret

tk_end:
    CMPI r8, KEY_END
    JNZ r1, tk_ignore
    LDI r20, SEND_BUF
    LDI r1, 27
    STORE r20, r1
    MOV r22, r20
    ADD r22, r7
    LDI r1, 91
    STORE r22, r1
    MOV r22, r20
    LDI r4, 2
    ADD r22, r4
    LDI r1, 70
    STORE r22, r1
    LDI r1, 3
    JMP tk_ret

tk_ignore:
    LDI r1, 0

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
    LDI r7, 1

    ; Tab bar background (10px tall at bottom)
    LDI r7, 0
    LDI r0, 246
    LDI r11, 256
    LDI r13, 10
    LDI r8, 0x1A1A2E
    RECTF r7, r0, r11, r13, r8

    ; Load active tab
    LDI r20, ACTIVE_TAB
    LOAD r28, r20

    ; Draw each tab
    LDI r12, 0
    LDI r6, 0       ; x position for tab label

dtb_loop:
    ; Check if tab is active
    MOV r15, r12
    LDI r20, ACTIVE_TAB
    LOAD r1, r20
    CMP r15, r1
    JZ r1, dtb_active

    ; Inactive tab colors
    LDI r10, 0x888888
    LDI r3, 0x1A1A2E
    JMP dtb_draw

dtb_active:
    LDI r10, 0xFFFFFF
    LDI r3, 0x333355

dtb_draw:
    ; Draw tab background (highlight box)
    ; x = r6, y = 246, w = 60, h = 8
    MOV r7, r6
    LDI r0, 247
    LDI r11, 58
    LDI r13, 8
    RECTF r7, r0, r11, r13, r3

    ; Build label in SCRATCH: "N:label"
    LDI r20, SCRATCH
    ; Tab number character: 49='1', 50='2', etc.
    LDI r1, 49
    ADD r1, r12
    STORE r20, r1
    ADD r20, r7
    LDI r1, 58     ; ':'
    STORE r20, r1
    ADD r20, r7

    ; Check if tab has PTY
    PUSH r12
    CALL get_tab_pty
    ; r20 = handle (but we need to re-derive meta...)
    ; Actually r20 is PTY handle from get_tab_pty
    LDI r4, 0xFFFF
    CMP r20, r4
    POP r12
    JZ r1, dtb_empty

    ; Check connected
    PUSH r12
    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 4
    ADD r22, r4
    LOAD r1, r22
    POP r12
    JZ r1, dtb_dead

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
    MOV r7, r6
    ADD r7, r7        ; x + 2
    LDI r0, 248
    LDI r11, SCRATCH
    SMALLTEXT r7, r0, r11, r10, r3

    ; Advance x position
    LDI r4, 62
    ADD r6, r4

    ADD r12, r7
    CMPI r12, 4
    BLT r1, dtb_loop

    ; Restore r7
    LDI r7, 1

    POP r31
    RET

; =========================================
; RENDER_ACTIVE_TAB -- render the active tab's text buffer
; =========================================
render_active_tab:
    PUSH r31
    LDI r7, 1

    ; Clear content area (y=0 to y=246)
    LDI r7, 0
    LDI r0, 0
    LDI r11, 256
    LDI r13, 246
    LDI r8, 0x0A0A0A
    RECTF r7, r0, r11, r13, r8

    ; Title bar background
    LDI r7, 0
    LDI r0, 0
    LDI r11, 256
    LDI r13, 10
    LDI r8, 0x1A1A2E
    RECTF r7, r0, r11, r13, r8

    ; Title: "tmux [tab N]"
    LDI r20, SCRATCH
    STRO r20, "tmux [tab "
    ; Find end
    LDI r12, 0
rat_find_end:
    LDI r4, SCRATCH
    ADD r4, r12
    LOAD r1, r4
    JZ r1, rat_append_num
    ADD r12, r7
    JMP rat_find_end

rat_append_num:
    LDI r20, ACTIVE_TAB
    LOAD r1, r20
    LDI r4, 49
    ADD r1, r4
    LDI r20, SCRATCH
    ADD r20, r12
    STORE r20, r1
    ADD r12, r7
    LDI r20, SCRATCH
    ADD r20, r12
    LDI r1, 93     ; ']'
    STORE r20, r1
    ADD r12, r7
    LDI r20, SCRATCH
    ADD r20, r12
    LDI r1, 0
    STORE r20, r1

    ; Draw title
    LDI r7, 2
    LDI r0, 1
    LDI r11, SCRATCH
    LDI r13, 0x44DD44
    LDI r8, 0x1A1A2E
    DRAWTEXT r7, r0, r11, r13, r8

    ; Render text buffer
    LDI r20, ACTIVE_TAB
    LOAD r12, r20

    CALL get_tab_buf_base
    MOV r15, r20      ; r15 = buf pointer
    LDI r6, 10       ; y position (start after title bar)
    LDI r7, 1
    LDI r2, 0  ; row counter

rat_row:
    ; Copy COLS chars to scratch for rendering
    LDI r16, SCRATCH
    LDI r17, 0
rat_copy_col:
    LOAD r5, r15
    STORE r16, r5
    ADD r15, r7
    ADD r16, r7
    ADD r17, r7
    CMPI r17, COLS
    BLT r1, rat_copy_col
    LDI r1, 0
    STORE r16, r1      ; null-terminate

    ; Render with SMALLTEXT
    LDI r7, 0
    LDI r2, SCRATCH
    LDI r10, 0xBBBBBB
    LDI r3, 0
    SMALLTEXT r7, r6, r2, r10, r3

    LDI r7, 1
    ; Advance y by 6
    ADD r6, r7
    ADD r6, r7
    ADD r6, r7
    ADD r6, r7
    ADD r6, r7
    ADD r6, r7

    ADD r2, r7
    CMPI r2, ROWS
    BLT r2, rat_row

    ; Cursor blink for active tab
    LDI r20, ACTIVE_TAB
    LOAD r12, r20
    CALL get_tab_meta
    ; Blink counter
    MOV r22, r20
    LDI r4, 5
    ADD r22, r4
    LOAD r1, r22
    ADD r1, r7
    STORE r22, r1
    LDI r4, 8
    AND r1, r4
    CMPI r1, 4
    BGE r1, cursor_skip

    ; Draw cursor
    CALL get_tab_meta
    MOV r22, r20
    LDI r4, 1
    ADD r22, r4
    LOAD r1, r22     ; CUR_COL
    LDI r4, 3
    MUL r1, r4
    MOV r22, r20
    LDI r4, 2
    ADD r22, r4
    LOAD r0, r22     ; CUR_ROW
    LDI r4, 6
    MUL r0, r4
    LDI r4, 10
    ADD r0, r4       ; + title bar offset
    LDI r11, 2
    LDI r13, 5
    LDI r8, 0x44FF44
    RECTF r1, r0, r11, r13, r8

cursor_skip:
    LDI r7, 1
    POP r31
    RET
