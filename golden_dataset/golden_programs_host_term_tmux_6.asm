; DESCRIPTION: Draws a red object at the screen with fixed size.

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
;   r6  constant 1
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
LDI r6, 1
LDI r30, 0xFD00

; Dark background
LDI r11, 0x0A0A0A
FILL r11

; Initialize all 4 tab metadata: PTY=0xFFFF (unused), rest=0
LDI r12, 0
init_tabs_loop:
    ; PTY handle = 0xFFFF (unused)
    LDI r20, TAB_META
    MOV r21, r12
    LDI r8, 32
    MUL r21, r8
    ADD r20, r21
    LDI r11, 0xFFFF
    STORE r20, r11

    ; CUR_COL = 0
    MOV r22, r20
    ADD r22, r6
    LDI r11, 0
    STORE r22, r11

    ; CUR_ROW = 0
    MOV r22, r20
    LDI r8, 2
    ADD r22, r8
    LDI r11, 0
    STORE r22, r11

    ; ANSI_STATE = 0
    MOV r22, r20
    LDI r8, 3
    ADD r22, r8
    LDI r11, 0
    STORE r22, r11

    ; CONNECTED = 0
    MOV r22, r20
    LDI r8, 4
    ADD r22, r8
    LDI r11, 0
    STORE r22, r11

    ; BLINK = 0
    MOV r22, r20
    LDI r8, 5
    ADD r22, r8
    LDI r11, 0
    STORE r22, r11

    ADD r12, r6
    CMPI r12, 4
    BLT r11, init_tabs_loop

; Clear all 4 tab text buffers to spaces
LDI r12, 0
clear_tabs_buf:
    ; Get buffer base for tab r12
    CALL get_tab_buf_base
    ; r20 = buffer base
    LDI r9, 32
    LDI r7, TAB_BUF_CELLS
    MOV r21, r20
    LDI r8, TAB_BUF_CELLS
    ADD r21, r8
ctb_loop:
    STORE r20, r9
    ADD r20, r6
    CMP r20, r21
    BLT r11, ctb_loop

    ADD r12, r6
    CMPI r12, 4
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
LDI r12, 0
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
    LDI r12, 0
    CALL drain_tab
    CALL render_active_tab
    CALL draw_tab_bar
    FRAME
    ADD r22, r6
    CMPI r22, 40
    BLT r11, startup_drain

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r6, 1

    ; Drain ALL tabs (background buffering)
    LDI r12, 0
drain_all_loop:
    CALL drain_tab
    ADD r12, r6
    CMPI r12, 4
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
    IKEY r0
    JZ r0, main_loop

    ; Check tab switch keys
    CALL check_tab_switch
    ; r11 = 1 if tab was switched (consumed the key)
    CMPI r11, 1
    JZ r11, main_loop

    ; Check Ctrl+Shift+T (new tab)
    CMPI r0, CS_T
    JNZ r11, check_close
    CALL open_new_tab
    JMP main_loop

check_close:
    ; Check Ctrl+Shift+W (close tab)
    CMPI r0, CS_W
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
    LDI r8, 0xFFFF
    CMP r20, r8
    JZ r11, main_loop

    ; PTYWRITE handle, send_buf, len
    MOV r9, r20       ; handle
    LDI r8, SEND_BUF
    ; r11 = byte count from translate_key
    PTYWRITE r9, r8, r11
    JMP main_loop

; =========================================
; GET_TAB_BUF_BASE -- return buffer address for tab r12
; Returns: r20 = buffer base address
; Clobbers: r8
; =========================================
get_tab_buf_base:
    CMPI r12, 0
    JNZ r11, gtbb_t1
    LDI r20, TAB0_BUF
    RET
gtbb_t1:
    CMPI r12, 1
    JNZ r11, gtbb_t2
    LDI r20, TAB1_BUF
    RET
gtbb_t2:
    CMPI r12, 2
    JNZ r11, gtbb_t3
    LDI r20, TAB2_BUF
    RET
gtbb_t3:
    LDI r20, TAB3_BUF
    RET

; =========================================
; GET_TAB_META -- return metadata base for tab r12
; Returns: r20 = metadata base address
; Clobbers: r8
; =========================================
get_tab_meta:
    LDI r20, TAB_META
    MOV r8, r12
    LDI r21, 32
    MUL r8, r21
    ADD r20, r8
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
; Uses: CMD_BUF, r0, r12
; =========================================
spawn_tab:
    PUSH r31
    LDI r6, 1

    ; PTYOPEN cmd_addr, handle_reg
    LDI r0, CMD_BUF
    LDI r8, 10
    PTYOPEN r0, r8

    ; Check success
    CMPI r11, 0
    JNZ r11, st_fail

    ; Store handle in tab metadata
    CALL get_tab_meta
    ; r20 = meta base
    STORE r20, r8    ; store handle (r8 from PTYOPEN result)

    ; Mark connected
    MOV r22, r20
    LDI r8, 4
    ADD r22, r8
    LDI r11, 1
    STORE r22, r11

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
    LDI r6, 1

    ; Get PTY handle
    CALL get_tab_pty
    ; r20 = PTY handle

    ; Check if slot is in use
    LDI r8, 0xFFFF
    CMP r20, r8
    JZ r11, dt_skip

    ; PTYREAD handle, recv_buf, max_len
    MOV r9, r20
    LDI r8, RECV_BUF
    LDI r4, 512
    PTYREAD r9, r8, r4
    MOV r4, r11

    ; Check for closed
    LDI r8, 0xFFFFFFFF
    CMP r4, r8
    JNZ r11, dt_process

    ; Mark disconnected
    CALL get_tab_meta
    MOV r22, r20
    LDI r8, 4
    ADD r22, r8
    LDI r11, 0
    STORE r22, r11
    JMP dt_skip

dt_process:
    ; Process each byte through ANSI state machine for this tab
    CMPI r4, 0
    JZ r11, dt_skip

    LDI r1, 0
dt_byte_loop:
    CMP r1, r4
    BGE r11, dt_skip

    LDI r20, RECV_BUF
    ADD r20, r1
    LOAD r0, r20
    CALL process_byte_tab
    ADD r1, r6
    JMP dt_byte_loop

dt_skip:
    POP r12
    POP r31
    RET

; =========================================
; PROCESS_BYTE_TAB -- process byte r0 for tab r12
; Uses tab-specific ANSI state and cursor
; =========================================
process_byte_tab:
    PUSH r31
    LDI r6, 1

    ; Load ANSI state for this tab
    CALL get_tab_meta
    MOV r22, r20
    LDI r8, 3
    ADD r22, r8
    LOAD r10, r22

    ; State: NORMAL
    CMPI r10, ANS_NORMAL
    JNZ r11, pbt_check_esc

    CMPI r0, 27
    JNZ r11, pbt_normal_byte

    ; Saw ESC
    CALL get_tab_meta
    MOV r22, r20
    LDI r8, 3
    ADD r22, r8
    LDI r11, ANS_ESC
    STORE r22, r11
    JMP pbt_ret

pbt_normal_byte:
    CALL append_byte_tab
    JMP pbt_ret

pbt_check_esc:
    CMPI r10, ANS_ESC
    JNZ r11, pbt_check_csi

    CMPI r0, 91
    JNZ r11, pbt_esc_other

    CALL get_tab_meta
    MOV r22, r20
    LDI r8, 3
    ADD r22, r8
    LDI r11, ANS_CSI
    STORE r22, r11
    JMP pbt_ret

pbt_esc_other:
    CALL get_tab_meta
    MOV r22, r20
    LDI r8, 3
    ADD r22, r8
    LDI r11, ANS_NORMAL
    STORE r22, r11
    JMP pbt_ret

pbt_check_csi:
    CMPI r10, ANS_CSI
    JNZ r11, pbt_reset

    ; CSI terminator
    CMPI r0, 64
    BLT r11, pbt_ret

    CALL get_tab_meta
    MOV r22, r20
    LDI r8, 3
    ADD r22, r8
    LDI r11, ANS_NORMAL
    STORE r22, r11
    JMP pbt_ret

pbt_reset:
    CALL get_tab_meta
    MOV r22, r20
    LDI r8, 3
    ADD r22, r8
    LDI r11, ANS_NORMAL
    STORE r22, r11

pbt_ret:
    POP r31
    RET

; =========================================
; APPEND_BYTE_TAB -- append r0 to tab r12's text buffer
; =========================================
append_byte_tab:
    PUSH r31
    LDI r6, 1

    ; Newline
    CMPI r0, 10
    JNZ r11, abt_check_cr
    CALL do_newline_tab
    JMP abt_ret

abt_check_cr:
    CMPI r0, 13
    JNZ r11, abt_check_print
    ; col = 0
    CALL get_tab_meta
    MOV r22, r20
    LDI r8, 1
    ADD r22, r8
    LDI r11, 0
    STORE r22, r11
    JMP abt_ret

abt_check_print:
    CMPI r0, 32
    BLT r11, abt_ret
    CMPI r0, 127
    BGE r11, abt_ret

    ; buf[row*COLS + col] = r0
    CALL get_tab_meta
    ; r20 = meta base
    MOV r21, r20
    LDI r8, 2
    ADD r21, r8
    LOAD r14, r21     ; r14 = CUR_ROW
    LDI r13, COLS
    MUL r14, r13
    MOV r21, r20
    LDI r8, 1
    ADD r21, r8
    LOAD r11, r21     ; r11 = CUR_COL
    ADD r14, r11

    CALL get_tab_buf_base
    ADD r20, r14
    STORE r20, r0

    ; col++
    CALL get_tab_meta
    MOV r22, r20
    LDI r8, 1
    ADD r22, r8
    LOAD r11, r22
    ADD r11, r6
    STORE r22, r11
    CMPI r11, COLS
    JNZ r11, abt_ret
    CALL do_newline_tab

abt_ret:
    POP r31
    RET

; =========================================
; DO_NEWLINE_TAB -- newline for tab r12
; =========================================
do_newline_tab:
    PUSH r31
    LDI r6, 1

    ; col = 0
    CALL get_tab_meta
    MOV r22, r20
    LDI r8, 1
    ADD r22, r8
    LDI r11, 0
    STORE r22, r11

    ; row++
    MOV r22, r20
    LDI r8, 2
    ADD r22, r8
    LOAD r9, r22
    ADD r9, r6
    CMPI r9, ROWS
    BLT r11, dnt_store
    CALL scroll_up_tab
    LDI r9, 25       ; ROWS-1
dnt_store:
    ; Re-get meta (scroll_up_tab may have changed r20)
    CALL get_tab_meta
    MOV r22, r20
    LDI r8, 2
    ADD r22, r8
    STORE r22, r9

    POP r31
    RET

; =========================================
; SCROLL_UP_TAB -- scroll text buffer for tab r12
; =========================================
scroll_up_tab:
    PUSH r31
    LDI r6, 1

    ; Shift rows 1..(ROWS-1) up to 0..(ROWS-2), clear last row
    PUSH r12
    LDI r3, 0
sut_loop:
    CMPI r3, 25     ; ROWS-1
    BGE r11, sut_clear

    ; src = BUF + (row+1)*COLS
    CALL get_tab_buf_base
    MOV r21, r3
    ADD r21, r6
    LDI r8, COLS
    MUL r21, r8
    ADD r20, r21     ; r20 = src

    ; dst = BUF + row*COLS
    CALL get_tab_buf_base
    MOV r22, r3
    LDI r8, COLS
    MUL r22, r8
    ADD r21, r22     ; r21 = dst

    ; Copy COLS cells
    LDI r15, 0
sut_copy:
    LOAD r11, r20
    STORE r21, r11
    ADD r20, r6
    ADD r21, r6
    ADD r15, r6
    CMPI r15, COLS
    BLT r11, sut_copy

    ADD r3, r6
    JMP sut_loop

sut_clear:
    ; Clear last row
    CALL get_tab_buf_base
    LDI r8, 25
    LDI r22, COLS
    MUL r8, r22
    ADD r20, r8
    LDI r9, 32
    LDI r2, 0
scut_loop:
    STORE r20, r9
    ADD r20, r6
    ADD r2, r6
    CMPI r2, COLS
    BLT r11, scut_loop

    POP r12
    POP r31
    RET

; =========================================
; CHECK_TAB_SWITCH -- check if r0 is a tab switch key
; Returns: r11 = 1 if handled, 0 if not
; =========================================
check_tab_switch:
    PUSH r31

    ; Ctrl+1 or Alt+1 -> tab 0
    CMPI r0, CTRL_1
    JZ r11, cts_tab0
    CMPI r0, ALT_1
    JZ r11, cts_tab0

    ; Ctrl+2 or Alt+2 -> tab 1
    CMPI r0, CTRL_2
    JZ r11, cts_tab1
    CMPI r0, ALT_2
    JZ r11, cts_tab1

    ; Ctrl+3 or Alt+3 -> tab 2
    CMPI r0, CTRL_3
    JZ r11, cts_tab2
    CMPI r0, ALT_3
    JZ r11, cts_tab2

    ; Ctrl+4 or Alt+4 -> tab 3
    CMPI r0, CTRL_4
    JZ r11, cts_tab3
    CMPI r0, ALT_4
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
    LDI r6, 1

    ; Check if tab has a PTY
    MOV r12, r11
    CALL get_tab_pty
    ; r20 = PTY handle
    LDI r8, 0xFFFF
    CMP r20, r8
    JZ r11, st_skip

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
    LDI r6, 1

    ; Find first unused tab
    LDI r12, 0
ont_loop:
    CALL get_tab_pty
    LDI r8, 0xFFFF
    CMP r20, r8
    JZ r11, ont_found
    ADD r12, r6
    CMPI r12, 4
    BLT r11, ont_loop
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
    LDI r6, 1

    LDI r20, ACTIVE_TAB
    LOAD r12, r20

    ; Get PTY handle
    CALL get_tab_pty
    ; r20 = handle

    ; PTYCLOSE handle_reg
    ; We need the handle in a register for PTYCLOSE
    MOV r8, r20
    PTYCLOSE r8

    ; Clear tab metadata
    CALL get_tab_meta
    LDI r11, 0xFFFF
    STORE r20, r11      ; PTY = unused
    MOV r22, r20
    LDI r8, 4
    ADD r22, r8
    LDI r11, 0
    STORE r22, r11      ; CONNECTED = 0

    ; Find another active tab to switch to
    LDI r12, 0
cat_find:
    CMPI r12, 4
    BGE r11, cat_done
    CALL get_tab_pty
    LDI r8, 0xFFFF
    CMP r20, r8
    JNZ r11, cat_switch
    ADD r12, r6
    JMP cat_find

cat_switch:
    LDI r20, ACTIVE_TAB
    STORE r20, r12

cat_done:
    POP r31
    RET

; =========================================
; TRANSLATE_KEY -- translate IKEY code to PTY byte(s)
; Fills SEND_BUF, returns byte count in r11
; r0 = raw IKEY value
; =========================================
translate_key:
    PUSH r31
    LDI r6, 1

    ; Printable ASCII (32-126)
    CMPI r0, 32
    BLT r11, tk_special
    CMPI r0, 127
    BGE r11, tk_special
    LDI r20, SEND_BUF
    STORE r20, r0
    LDI r11, 1
    JMP tk_ret

tk_special:
    ; Enter (0x0D) -> \n (10)
    CMPI r0, 13
    JNZ r11, tk_bs
    LDI r20, SEND_BUF
    LDI r11, 10
    STORE r20, r11
    LDI r11, 1
    JMP tk_ret

tk_bs:
    ; Backspace (0x08) -> DEL (0x7F)
    CMPI r0, 8
    JNZ r11, tk_del
    LDI r20, SEND_BUF
    LDI r11, 127
    STORE r20, r11
    LDI r11, 1
    JMP tk_ret

tk_del:
    CMPI r0, 127
    JNZ r11, tk_tab
    LDI r20, SEND_BUF
    LDI r11, 127
    STORE r20, r11
    LDI r11, 1
    JMP tk_ret

tk_tab:
    CMPI r0, 9
    JNZ r11, tk_ctrl_c
    LDI r20, SEND_BUF
    LDI r11, 9
    STORE r20, r11
    LDI r11, 1
    JMP tk_ret

tk_ctrl_c:
    CMPI r0, 3
    JNZ r11, tk_ctrl_d
    LDI r20, SEND_BUF
    LDI r11, 3
    STORE r20, r11
    LDI r11, 1
    JMP tk_ret

tk_ctrl_d:
    CMPI r0, 4
    JNZ r11, tk_escape
    LDI r20, SEND_BUF
    LDI r11, 4
    STORE r20, r11
    LDI r11, 1
    JMP tk_ret

tk_escape:
    CMPI r0, 27
    JNZ r11, tk_arrow_up
    LDI r20, SEND_BUF
    LDI r11, 27
    STORE r20, r11
    LDI r11, 1
    JMP tk_ret

tk_arrow_up:
    CMPI r0, KEY_UP
    JNZ r11, tk_arrow_down
    LDI r20, SEND_BUF
    LDI r11, 27
    STORE r20, r11
    MOV r22, r20
    ADD r22, r6
    LDI r11, 91
    STORE r22, r11
    MOV r22, r20
    LDI r8, 2
    ADD r22, r8
    LDI r11, 65
    STORE r22, r11
    LDI r11, 3
    JMP tk_ret

tk_arrow_down:
    CMPI r0, KEY_DOWN
    JNZ r11, tk_arrow_right
    LDI r20, SEND_BUF
    LDI r11, 27
    STORE r20, r11
    MOV r22, r20
    ADD r22, r6
    LDI r11, 91
    STORE r22, r11
    MOV r22, r20
    LDI r8, 2
    ADD r22, r8
    LDI r11, 66
    STORE r22, r11
    LDI r11, 3
    JMP tk_ret

tk_arrow_right:
    CMPI r0, KEY_RIGHT
    JNZ r11, tk_arrow_left
    LDI r20, SEND_BUF
    LDI r11, 27
    STORE r20, r11
    MOV r22, r20
    ADD r22, r6
    LDI r11, 91
    STORE r22, r11
    MOV r22, r20
    LDI r8, 2
    ADD r22, r8
    LDI r11, 67
    STORE r22, r11
    LDI r11, 3
    JMP tk_ret

tk_arrow_left:
    CMPI r0, KEY_LEFT
    JNZ r11, tk_home
    LDI r20, SEND_BUF
    LDI r11, 27
    STORE r20, r11
    MOV r22, r20
    ADD r22, r6
    LDI r11, 91
    STORE r22, r11
    MOV r22, r20
    LDI r8, 2
    ADD r22, r8
    LDI r11, 68
    STORE r22, r11
    LDI r11, 3
    JMP tk_ret

tk_home:
    CMPI r0, KEY_HOME
    JNZ r11, tk_end
    LDI r20, SEND_BUF
    LDI r11, 27
    STORE r20, r11
    MOV r22, r20
    ADD r22, r6
    LDI r11, 91
    STORE r22, r11
    MOV r22, r20
    LDI r8, 2
    ADD r22, r8
    LDI r11, 72
    STORE r22, r11
    LDI r11, 3
    JMP tk_ret

tk_end:
    CMPI r0, KEY_END
    JNZ r11, tk_ignore
    LDI r20, SEND_BUF
    LDI r11, 27
    STORE r20, r11
    MOV r22, r20
    ADD r22, r6
    LDI r11, 91
    STORE r22, r11
    MOV r22, r20
    LDI r8, 2
    ADD r22, r8
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
    LDI r6, 1

    ; Tab bar background (10px tall at bottom)
    LDI r6, 0
    LDI r14, 246
    LDI r13, 256
    LDI r10, 10
    LDI r0, 0x1A1A2E
    RECTF r6, r14, r13, r10, r0

    ; Load active tab
    LDI r20, ACTIVE_TAB
    LOAD r28, r20

    ; Draw each tab
    LDI r12, 0
    LDI r3, 0       ; x position for tab label

dtb_loop:
    ; Check if tab is active
    MOV r5, r12
    LDI r20, ACTIVE_TAB
    LOAD r11, r20
    CMP r5, r11
    JZ r11, dtb_active

    ; Inactive tab colors
    LDI r2, 0x888888
    LDI r7, 0x1A1A2E
    JMP dtb_draw

dtb_active:
    LDI r2, 0xFFFFFF
    LDI r7, 0x333355

dtb_draw:
    ; Draw tab background (highlight box)
    ; x = r3, y = 246, w = 60, h = 8
    MOV r6, r3
    LDI r14, 247
    LDI r13, 58
    LDI r10, 8
    RECTF r6, r14, r13, r10, r7

    ; Build label in SCRATCH: "N:label"
    LDI r20, SCRATCH
    ; Tab number character: 49='1', 50='2', etc.
    LDI r11, 49
    ADD r11, r12
    STORE r20, r11
    ADD r20, r6
    LDI r11, 58     ; ':'
    STORE r20, r11
    ADD r20, r6

    ; Check if tab has PTY
    PUSH r12
    CALL get_tab_pty
    ; r20 = handle (but we need to re-derive meta...)
    ; Actually r20 is PTY handle from get_tab_pty
    LDI r8, 0xFFFF
    CMP r20, r8
    POP r12
    JZ r11, dtb_empty

    ; Check connected
    PUSH r12
    CALL get_tab_meta
    MOV r22, r20
    LDI r8, 4
    ADD r22, r8
    LOAD r11, r22
    POP r12
    JZ r11, dtb_dead

    ; Label = "bash"
    LDI r20, SCRATCH
    LDI r8, 2
    ADD r20, r8
    STRO r20, "bash"
    JMP dtb_render

dtb_dead:
    LDI r20, SCRATCH
    LDI r8, 2
    ADD r20, r8
    STRO r20, "dead"
    JMP dtb_render

dtb_empty:
    LDI r20, SCRATCH
    LDI r8, 2
    ADD r20, r8
    STRO r20, "---"

dtb_render:
    ; Draw label with SMALLTEXT
    MOV r6, r3
    ADD r6, r6        ; x + 2
    LDI r14, 248
    LDI r13, SCRATCH
    SMALLTEXT r6, r14, r13, r2, r7

    ; Advance x position
    LDI r8, 62
    ADD r3, r8

    ADD r12, r6
    CMPI r12, 4
    BLT r11, dtb_loop

    ; Restore r6
    LDI r6, 1

    POP r31
    RET

; =========================================
; RENDER_ACTIVE_TAB -- render the active tab's text buffer
; =========================================
render_active_tab:
    PUSH r31
    LDI r6, 1

    ; Clear content area (y=0 to y=246)
    LDI r6, 0
    LDI r14, 0
    LDI r13, 256
    LDI r10, 246
    LDI r0, 0x0A0A0A
    RECTF r6, r14, r13, r10, r0

    ; Title bar background
    LDI r6, 0
    LDI r14, 0
    LDI r13, 256
    LDI r10, 10
    LDI r0, 0x1A1A2E
    RECTF r6, r14, r13, r10, r0

    ; Title: "tmux [tab N]"
    LDI r20, SCRATCH
    STRO r20, "tmux [tab "
    ; Find end
    LDI r12, 0
rat_find_end:
    LDI r8, SCRATCH
    ADD r8, r12
    LOAD r11, r8
    JZ r11, rat_append_num
    ADD r12, r6
    JMP rat_find_end

rat_append_num:
    LDI r20, ACTIVE_TAB
    LOAD r11, r20
    LDI r8, 49
    ADD r11, r8
    LDI r20, SCRATCH
    ADD r20, r12
    STORE r20, r11
    ADD r12, r6
    LDI r20, SCRATCH
    ADD r20, r12
    LDI r11, 93     ; ']'
    STORE r20, r11
    ADD r12, r6
    LDI r20, SCRATCH
    ADD r20, r12
    LDI r11, 0
    STORE r20, r11

    ; Draw title
    LDI r6, 2
    LDI r14, 1
    LDI r13, SCRATCH
    LDI r10, 0x44DD44
    LDI r0, 0x1A1A2E
    DRAWTEXT r6, r14, r13, r10, r0

    ; Render text buffer
    LDI r20, ACTIVE_TAB
    LOAD r12, r20

    CALL get_tab_buf_base
    MOV r5, r20      ; r5 = buf pointer
    LDI r3, 10       ; y position (start after title bar)
    LDI r6, 1
    LDI r15, 0  ; row counter

rat_row:
    ; Copy COLS chars to scratch for rendering
    LDI r16, SCRATCH
    LDI r17, 0
rat_copy_col:
    LOAD r9, r5
    STORE r16, r9
    ADD r5, r6
    ADD r16, r6
    ADD r17, r6
    CMPI r17, COLS
    BLT r11, rat_copy_col
    LDI r11, 0
    STORE r16, r11      ; null-terminate

    ; Render with SMALLTEXT
    LDI r6, 0
    LDI r15, SCRATCH
    LDI r2, 0xBBBBBB
    LDI r7, 0
    SMALLTEXT r6, r3, r15, r2, r7

    LDI r6, 1
    ; Advance y by 6
    ADD r3, r6
    ADD r3, r6
    ADD r3, r6
    ADD r3, r6
    ADD r3, r6
    ADD r3, r6

    ADD r15, r6
    CMPI r15, ROWS
    BLT r15, rat_row

    ; Cursor blink for active tab
    LDI r20, ACTIVE_TAB
    LOAD r12, r20
    CALL get_tab_meta
    ; Blink counter
    MOV r22, r20
    LDI r8, 5
    ADD r22, r8
    LOAD r11, r22
    ADD r11, r6
    STORE r22, r11
    LDI r8, 8
    AND r11, r8
    CMPI r11, 4
    BGE r11, cursor_skip

    ; Draw cursor
    CALL get_tab_meta
    MOV r22, r20
    LDI r8, 1
    ADD r22, r8
    LOAD r11, r22     ; CUR_COL
    LDI r8, 3
    MUL r11, r8
    MOV r22, r20
    LDI r8, 2
    ADD r22, r8
    LOAD r14, r22     ; CUR_ROW
    LDI r8, 6
    MUL r14, r8
    LDI r8, 10
    ADD r14, r8       ; + title bar offset
    LDI r13, 2
    LDI r10, 5
    LDI r0, 0x44FF44
    RECTF r11, r14, r13, r10, r0

cursor_skip:
    LDI r6, 1
    POP r31
    RET
