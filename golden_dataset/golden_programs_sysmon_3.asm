; DESCRIPTION: Render a colored object at the screen.

; sysmon.asm -- System Dashboard for Geometry OS (Phase 140)
;
; Shows: host memory stats from /proc/meminfo, GeOS process count,
;        frame count (uptime), and VM status.
;
; RAM Layout:
;   0x6000-0x60FF  String buffers for display
;   0x6100-0x61FF  Number conversion buffer
;   0x6200-0x6AFF  /proc/meminfo read buffer (host file I/O)
;   0x6B00         Host file handle
;   0x6B04         Bytes read
;
; Uses: FSOPEN, FSREAD, FSCLOSE, NPROC, DRAWTEXT, RECTF, FILL, FRAME, STRO

#define TICKS   0xFFE
#define BUF     0x6000
#define NUMBUF  0x6100
#define PROCBUF 0x6200
#define HANDLE  0x6B00
#define BYTESRD 0x6B04
#define BUFSIZE 0x0200    ; 512 bytes for /proc read

#define COL_BG     0x0D1B2A
#define COL_DARK   0x141428
#define COL_PANEL  0x1B2838
#define COL_TITLE  0x1B3A5C
#define COL_FG     0xFFFFFF
#define COL_LABEL  0x8888CC
#define COL_GREEN  0x44FF44
#define COL_YELLOW 0xFFFF44
#define COL_CYAN   0x44FFFF
#define COL_GRAY   0x666688
#define COL_AMBER  0xFFAA44
#define COL_BAR_BG 0x222244
#define COL_BAR_FG 0x44AA44

; Init
LDI r30, 0xFD00
LDI r13, 1

; =========================================
; Main loop
; =========================================
main_loop:
    LDI r13, COL_BG
    FILL r13

    ; Title bar
    LDI r13, 0
    LDI r14, 0
    LDI r12, 256
    LDI r2, 22
    LDI r1, COL_TITLE
    RECTF r13, r14, r12, r2, r1

    LDI r20, BUF
    STRO r20, "System Dashboard"
    LDI r13, 60
    LDI r14, 5
    LDI r12, BUF
    LDI r2, COL_FG
    LDI r1, COL_TITLE
    DRAWTEXT r13, r14, r12, r2, r1

    ; ---- GeOS Status Panel (left side) ----
    LDI r13, 4
    LDI r14, 28
    LDI r12, 124
    LDI r2, 100
    LDI r1, COL_PANEL
    RECTF r13, r14, r12, r2, r1

    ; Panel title
    LDI r20, BUF
    STRO r20, "GeOS Status"
    LDI r13, 8
    LDI r14, 30
    LDI r12, BUF
    LDI r2, COL_CYAN
    LDI r1, COL_PANEL
    DRAWTEXT r13, r14, r12, r2, r1

    ; Separator
    LDI r13, 8
    LDI r14, 42
    LDI r12, 116
    LDI r2, 1
    LDI r1, COL_GRAY
    RECTF r13, r14, r12, r2, r1

    ; Process count
    LDI r20, BUF
    STRO r20, "Processes"
    LDI r13, 8
    LDI r14, 48
    LDI r12, BUF
    LDI r2, COL_LABEL
    LDI r1, 0
    DRAWTEXT r13, r14, r12, r2, r1

    NPROC
    MOV r10, r3
    LDI r20, NUMBUF
    CALL int_to_str
    LDI r13, 90
    LDI r14, 48
    LDI r12, NUMBUF
    LDI r2, COL_GREEN
    LDI r1, 0
    DRAWTEXT r13, r14, r12, r2, r1

    ; Frame count (uptime)
    LDI r20, BUF
    STRO r20, "Frames"
    LDI r13, 8
    LDI r14, 62
    LDI r12, BUF
    LDI r2, COL_LABEL
    LDI r1, 0
    DRAWTEXT r13, r14, r12, r2, r1

    LDI r20, TICKS
    LOAD r10, r20
    LDI r20, NUMBUF
    CALL int_to_str
    LDI r13, 90
    LDI r14, 62
    LDI r12, NUMBUF
    LDI r2, COL_GREEN
    LDI r1, 0
    DRAWTEXT r13, r14, r12, r2, r1

    ; RAM Size
    LDI r20, BUF
    STRO r20, "RAM"
    LDI r13, 8
    LDI r14, 76
    LDI r12, BUF
    LDI r2, COL_LABEL
    LDI r1, 0
    DRAWTEXT r13, r14, r12, r2, r1

    LDI r20, BUF
    STRO r20, "64K x u32"
    LDI r13, 60
    LDI r14, 76
    LDI r12, BUF
    LDI r2, COL_FG
    LDI r1, 0
    DRAWTEXT r13, r14, r12, r2, r1

    ; Screen
    LDI r20, BUF
    STRO r20, "Screen"
    LDI r13, 8
    LDI r14, 90
    LDI r12, BUF
    LDI r2, COL_LABEL
    LDI r1, 0
    DRAWTEXT r13, r14, r12, r2, r1

    LDI r20, BUF
    STRO r20, "256x256"
    LDI r13, 60
    LDI r14, 90
    LDI r12, BUF
    LDI r2, COL_FG
    LDI r1, 0
    DRAWTEXT r13, r14, r12, r2, r1

    ; Opcodes
    LDI r20, BUF
    STRO r20, "Opcodes"
    LDI r13, 8
    LDI r14, 104
    LDI r12, BUF
    LDI r2, COL_LABEL
    LDI r1, 0
    DRAWTEXT r13, r14, r12, r2, r1

    LDI r20, BUF
    STRO r20, "150+"
    LDI r13, 60
    LDI r14, 104
    LDI r12, BUF
    LDI r2, COL_AMBER
    LDI r1, 0
    DRAWTEXT r13, r14, r12, r2, r1

    ; ---- Host Memory Panel (right side) ----
    LDI r13, 132
    LDI r14, 28
    LDI r12, 120
    LDI r2, 100
    LDI r1, COL_PANEL
    RECTF r13, r14, r12, r2, r1

    LDI r20, BUF
    STRO r20, "Host Memory"
    LDI r13, 136
    LDI r14, 30
    LDI r12, BUF
    LDI r2, COL_CYAN
    LDI r1, COL_PANEL
    DRAWTEXT r13, r14, r12, r2, r1

    ; Separator
    LDI r13, 136
    LDI r14, 42
    LDI r12, 112
    LDI r2, 1
    LDI r1, COL_GRAY
    RECTF r13, r14, r12, r2, r1

    ; Try to read /proc/meminfo
    ; First write the path "/proc/meminfo" into RAM
    LDI r20, BUF
    STRO r20, "/proc/meminfo"

    ; FSOPEN path_reg, mode_reg (0=read)
    LDI r13, BUF
    LDI r14, 0           ; mode = read
    FSOPEN r13, r14
    ; r3 = handle or 0xFFFFFFFF on error
    LDI r4, 0xFFFFFFFF
    CMP r3, r4
    JZ r3, meminfo_error

    ; Store handle
    LDI r20, HANDLE
    STORE r20, r3

    ; FSREAD handle_reg, buf_reg, len_reg
    LDI r20, HANDLE
    LOAD r13, r20         ; handle
    LDI r14, PROCBUF      ; dest buffer
    LDI r12, BUFSIZE      ; max bytes
    FSREAD r13, r14, r12
    ; r3 = bytes read

    LDI r4, 0xFFFFFFFF
    CMP r3, r4
    JZ r3, meminfo_close

    ; Store bytes read
    LDI r20, BYTESRD
    STORE r20, r3

    ; Close file
    LDI r20, HANDLE
    LOAD r13, r20
    FSCLOSE r13

    ; Parse MemTotal from the buffer
    ; We'll scan for "MemTotal:" and extract the number
    LDI r5, PROCBUF     ; buffer start
    LDI r11, 0           ; position
    LDI r7, 0           ; found flag

    ; Scan for "MemTotal:"
scan_memtotal:
    ; Check if we've read enough
    LDI r20, BYTESRD
    LOAD r4, r20
    LDI r16, 9           ; "MemTotal:" is 9 chars
    ADD r16, r11
    CMP r16, r4
    BGE r3, scan_done_mt

    ; Check if current position starts with "MemTotal:"
    MOV r20, r5
    ADD r20, r11
    LOAD r10, r20        ; char at position
    LDI r4, 77          ; 'M'
    CMP r10, r4
    JNZ r3, scan_next_mt

    ; Check next char 'e'
    LDI r4, 1
    ADD r20, r4
    LOAD r10, r20
    LDI r4, 101         ; 'e'
    CMP r10, r4
    JNZ r3, scan_next_mt

    ; Check 'm'
    LDI r4, 2
    MOV r16, r5
    ADD r16, r11
    ADD r16, r4
    LOAD r10, r16
    LDI r4, 109         ; 'm'
    CMP r10, r4
    JNZ r3, scan_next_mt

    ; Found "Mem" - assume MemTotal. Skip to number after ":"
    MOV r20, r5
    ADD r20, r11
    LDI r4, 9           ; skip "MemTotal:"
    ADD r20, r4
    ; Skip spaces
skip_spaces_mt:
    LOAD r10, r20
    LDI r4, 32          ; space
    CMP r10, r4
    JNZ r3, parse_num_mt
    LDI r4, 1
    ADD r20, r4
    JMP skip_spaces_mt

parse_num_mt:
    ; Parse decimal number at r20 into r10
    LDI r10, 0           ; accumulated number
parse_digit_mt:
    PUSH r20
    LOAD r4, r20        ; char
    LDI r16, 48          ; '0'
    CMP r4, r16
    BLT r3, parse_done_mt
    LDI r16, 57          ; '9'
    CMP r4, r16
    BGE r3, parse_next_chk_mt
    JMP parse_done_mt
parse_next_chk_mt:
    ; digit = char - '0'
    LDI r16, 48
    SUB r4, r16
    ; result = result * 10 + digit
    LDI r16, 10
    MUL r10, r16
    ADD r10, r4
    POP r20
    LDI r4, 1
    ADD r20, r4
    JMP parse_digit_mt

parse_done_mt:
    POP r20
    LDI r7, 1           ; found flag
    JMP scan_done_mt

scan_next_mt:
    LDI r4, 1
    ADD r11, r4
    JMP scan_memtotal

scan_done_mt:
    ; Display MemTotal if found
    CMP r7, r3          ; r3 is 0 from CMP
    LDI r4, 0
    CMP r7, r4
    JZ r3, show_meminfo_err

    ; r10 has MemTotal in kB. Display as MB: divide by 1024
    LDI r4, 1024
    DIV r10, r4

    LDI r20, BUF
    STRO r20, "Total RAM"
    LDI r13, 136
    LDI r14, 48
    LDI r12, BUF
    LDI r2, COL_LABEL
    LDI r1, 0
    DRAWTEXT r13, r14, r12, r2, r1

    LDI r20, NUMBUF
    CALL int_to_str
    LDI r13, 200
    LDI r14, 48
    LDI r12, NUMBUF
    LDI r2, COL_GREEN
    LDI r1, 0
    DRAWTEXT r13, r14, r12, r2, r1

    LDI r20, BUF
    STRO r20, "MB"
    LDI r13, 232
    LDI r14, 48
    LDI r12, BUF
    LDI r2, COL_GREEN
    LDI r1, 0
    DRAWTEXT r13, r14, r12, r2, r1

    ; Memory bar (visual indicator)
    LDI r13, 136
    LDI r14, 62
    LDI r12, 112
    LDI r2, 10
    LDI r1, COL_BAR_BG
    RECTF r13, r14, r12, r2, r1

    ; Fill bar proportional (assume r10 is MB, max ~16GB=16384MB)
    ; bar_width = r10 * 112 / 16384
    LDI r4, 112
    MUL r10, r4
    LDI r4, 16384
    DIV r10, r4
    ; Cap at 112
    LDI r4, 112
    CMP r10, r4
    BLT r3, draw_bar
    MOV r10, r4

draw_bar:
    LDI r13, 136
    LDI r14, 62
    MOV r12, r10
    LDI r2, 10
    LDI r1, COL_BAR_FG
    RECTF r13, r14, r12, r2, r1

    JMP host_panel_done

show_meminfo_err:
meminfo_error:
    LDI r20, BUF
    STRO r20, "Cannot read"
    LDI r13, 136
    LDI r14, 48
    LDI r12, BUF
    LDI r2, COL_YELLOW
    LDI r1, 0
    DRAWTEXT r13, r14, r12, r2, r1

    LDI r20, BUF
    STRO r20, "/proc/meminfo"
    LDI r13, 136
    LDI r14, 62
    LDI r12, BUF
    LDI r2, COL_YELLOW
    LDI r1, 0
    DRAWTEXT r13, r14, r12, r2, r1

meminfo_close:
    ; Try to close if we have a handle
    LDI r20, HANDLE
    LOAD r4, r20
    LDI r16, 0xFFFFFFFF
    CMP r4, r16
    JZ r3, host_panel_done
    MOV r13, r4
    FSCLOSE r13

host_panel_done:
    ; ---- Bottom panel: VM internals ----
    LDI r13, 4
    LDI r14, 134
    LDI r12, 248
    LDI r2, 50
    LDI r1, COL_DARK
    RECTF r13, r14, r12, r2, r1

    LDI r20, BUF
    STRO r20, "VM Registers"
    LDI r13, 8
    LDI r14, 136
    LDI r12, BUF
    LDI r2, COL_CYAN
    LDI r1, COL_DARK
    DRAWTEXT r13, r14, r12, r2, r1

    ; Show current PC
    LDI r20, BUF
    STRO r20, "PC"
    LDI r13, 8
    LDI r14, 152
    LDI r12, BUF
    LDI r2, COL_LABEL
    LDI r1, 0
    DRAWTEXT r13, r14, r12, r2, r1

    ; Display via PROCINFO (main process, field=1=PC)
    LDI r13, 0            ; PID 0
    LDI r14, 1            ; field = PC
    PROCINFO r13, r14
    MOV r10, r3
    LDI r20, NUMBUF
    CALL hex_to_str
    LDI r13, 40
    LDI r14, 152
    LDI r12, NUMBUF
    LDI r2, COL_GREEN
    LDI r1, 0
    DRAWTEXT r13, r14, r12, r2, r1

    ; Show opcode histogram top entry
    LDI r20, BUF
    STRO r20, "VM Status: Running"
    LDI r13, 80
    LDI r14, 152
    LDI r12, BUF
    LDI r2, COL_GREEN
    LDI r1, 0
    DRAWTEXT r13, r14, r12, r2, r1

    ; ---- Footer ----
    LDI r13, 0
    LDI r14, 236
    LDI r12, 256
    LDI r2, 20
    LDI r1, COL_TITLE
    RECTF r13, r14, r12, r2, r1

    LDI r20, BUF
    STRO r20, "Geometry OS v1.0  |  Q:Quit"
    LDI r13, 24
    LDI r14, 242
    LDI r12, BUF
    LDI r2, COL_GRAY
    LDI r1, COL_TITLE
    DRAWTEXT r13, r14, r12, r2, r1

    ; Handle input
    IKEY r4
    JZ r4, no_input
    LDI r16, 81          ; 'Q'
    CMP r4, r16
    JNZ r3, no_input
    HALT

no_input:
    FRAME
    JMP main_loop


; =========================================
; int_to_str subroutine
; Converts r10 (u32) to decimal string at r20
; Returns null-terminated string. r3 = start address.
; =========================================
int_to_str:
    PUSH r31
    PUSH r20
    LDI r16, 0

    JZ r10, its_zero

its_loop:
    MOV r18, r10
    LDI r17, 10
    MOD r18, r17
    LDI r19, 48
    ADD r18, r19
    PUSH r18
    LDI r17, 10
    DIV r10, r17
    LDI r19, 1
    ADD r16, r19
    JNZ r10, its_loop

its_write:
    POP r18
    STORE r20, r18
    LDI r19, 1
    ADD r20, r19
    LDI r19, 1
    SUB r16, r19
    JNZ r16, its_write

    LDI r18, 0
    STORE r20, r18
    POP r3
    POP r31
    RET

its_zero:
    LDI r18, 48
    STORE r20, r18
    LDI r19, 1
    ADD r20, r19
    LDI r18, 0
    STORE r20, r18
    POP r3
    POP r31
    RET

; =========================================
; hex_to_str subroutine
; Converts r10 (u32) to hex string "0x" prefix at r20
; Returns null-terminated. r3 = start address.
; =========================================
hex_to_str:
    PUSH r31
    PUSH r20

    LDI r18, 48
    STORE r20, r18
    LDI r19, 1
    ADD r20, r19
    LDI r18, 120
    STORE r20, r18
    ADD r20, r19

    ; 8 hardcoded nibble extractions
    MOV r18, r10
    LDI r19, 28
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r10
    LDI r19, 24
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r10
    LDI r19, 20
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r10
    LDI r19, 16
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r10
    LDI r19, 12
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r10
    LDI r19, 8
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r10
    LDI r19, 4
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r10
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    LDI r18, 0
    STORE r20, r18
    POP r3
    POP r31
    RET

hex_nibble_s:
    PUSH r31
    LDI r19, 10
    CMP r18, r19
    BGE r3, hex_alpha_s
    LDI r19, 48
    ADD r18, r19
    JMP hex_store_s
hex_alpha_s:
    LDI r19, 55
    ADD r18, r19
hex_store_s:
    STORE r20, r18
    LDI r19, 1
    ADD r20, r19
    POP r31
    RET
