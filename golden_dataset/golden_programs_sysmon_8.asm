; DESCRIPTION: This GeOS assembly code provides a system dashboard that displays various system statistics including host memory usage from `/proc/meminfo`, the count of GeOS processes, uptime in frames, and VM status. It uses file I/O operations to read memory information, parses it for total RAM, and visually represents memory usage with a bar graph. The dashboard also shows VM registers and an opcode histogram, and includes input handling to quit the application.

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
LDI r8, 1

; =========================================
; Main loop
; =========================================
main_loop:
    LDI r8, COL_BG
    FILL r8

    ; Title bar
    LDI r8, 0
    LDI r7, 0
    LDI r9, 256
    LDI r3, 22
    LDI r12, COL_TITLE
    RECTF r8, r7, r9, r3, r12

    LDI r20, BUF
    STRO r20, "System Dashboard"
    LDI r8, 60
    LDI r7, 5
    LDI r9, BUF
    LDI r3, COL_FG
    LDI r12, COL_TITLE
    DRAWTEXT r8, r7, r9, r3, r12

    ; ---- GeOS Status Panel (left side) ----
    LDI r8, 4
    LDI r7, 28
    LDI r9, 124
    LDI r3, 100
    LDI r12, COL_PANEL
    RECTF r8, r7, r9, r3, r12

    ; Panel title
    LDI r20, BUF
    STRO r20, "GeOS Status"
    LDI r8, 8
    LDI r7, 30
    LDI r9, BUF
    LDI r3, COL_CYAN
    LDI r12, COL_PANEL
    DRAWTEXT r8, r7, r9, r3, r12

    ; Separator
    LDI r8, 8
    LDI r7, 42
    LDI r9, 116
    LDI r3, 1
    LDI r12, COL_GRAY
    RECTF r8, r7, r9, r3, r12

    ; Process count
    LDI r20, BUF
    STRO r20, "Processes"
    LDI r8, 8
    LDI r7, 48
    LDI r9, BUF
    LDI r3, COL_LABEL
    LDI r12, 0
    DRAWTEXT r8, r7, r9, r3, r12

    NPROC
    MOV r4, r15
    LDI r20, NUMBUF
    CALL int_to_str
    LDI r8, 90
    LDI r7, 48
    LDI r9, NUMBUF
    LDI r3, COL_GREEN
    LDI r12, 0
    DRAWTEXT r8, r7, r9, r3, r12

    ; Frame count (uptime)
    LDI r20, BUF
    STRO r20, "Frames"
    LDI r8, 8
    LDI r7, 62
    LDI r9, BUF
    LDI r3, COL_LABEL
    LDI r12, 0
    DRAWTEXT r8, r7, r9, r3, r12

    LDI r20, TICKS
    LOAD r4, r20
    LDI r20, NUMBUF
    CALL int_to_str
    LDI r8, 90
    LDI r7, 62
    LDI r9, NUMBUF
    LDI r3, COL_GREEN
    LDI r12, 0
    DRAWTEXT r8, r7, r9, r3, r12

    ; RAM Size
    LDI r20, BUF
    STRO r20, "RAM"
    LDI r8, 8
    LDI r7, 76
    LDI r9, BUF
    LDI r3, COL_LABEL
    LDI r12, 0
    DRAWTEXT r8, r7, r9, r3, r12

    LDI r20, BUF
    STRO r20, "64K x u32"
    LDI r8, 60
    LDI r7, 76
    LDI r9, BUF
    LDI r3, COL_FG
    LDI r12, 0
    DRAWTEXT r8, r7, r9, r3, r12

    ; Screen
    LDI r20, BUF
    STRO r20, "Screen"
    LDI r8, 8
    LDI r7, 90
    LDI r9, BUF
    LDI r3, COL_LABEL
    LDI r12, 0
    DRAWTEXT r8, r7, r9, r3, r12

    LDI r20, BUF
    STRO r20, "256x256"
    LDI r8, 60
    LDI r7, 90
    LDI r9, BUF
    LDI r3, COL_FG
    LDI r12, 0
    DRAWTEXT r8, r7, r9, r3, r12

    ; Opcodes
    LDI r20, BUF
    STRO r20, "Opcodes"
    LDI r8, 8
    LDI r7, 104
    LDI r9, BUF
    LDI r3, COL_LABEL
    LDI r12, 0
    DRAWTEXT r8, r7, r9, r3, r12

    LDI r20, BUF
    STRO r20, "150+"
    LDI r8, 60
    LDI r7, 104
    LDI r9, BUF
    LDI r3, COL_AMBER
    LDI r12, 0
    DRAWTEXT r8, r7, r9, r3, r12

    ; ---- Host Memory Panel (right side) ----
    LDI r8, 132
    LDI r7, 28
    LDI r9, 120
    LDI r3, 100
    LDI r12, COL_PANEL
    RECTF r8, r7, r9, r3, r12

    LDI r20, BUF
    STRO r20, "Host Memory"
    LDI r8, 136
    LDI r7, 30
    LDI r9, BUF
    LDI r3, COL_CYAN
    LDI r12, COL_PANEL
    DRAWTEXT r8, r7, r9, r3, r12

    ; Separator
    LDI r8, 136
    LDI r7, 42
    LDI r9, 112
    LDI r3, 1
    LDI r12, COL_GRAY
    RECTF r8, r7, r9, r3, r12

    ; Try to read /proc/meminfo
    ; First write the path "/proc/meminfo" into RAM
    LDI r20, BUF
    STRO r20, "/proc/meminfo"

    ; FSOPEN path_reg, mode_reg (0=read)
    LDI r8, BUF
    LDI r7, 0           ; mode = read
    FSOPEN r8, r7
    ; r15 = handle or 0xFFFFFFFF on error
    LDI r2, 0xFFFFFFFF
    CMP r15, r2
    JZ r15, meminfo_error

    ; Store handle
    LDI r20, HANDLE
    STORE r20, r15

    ; FSREAD handle_reg, buf_reg, len_reg
    LDI r20, HANDLE
    LOAD r8, r20         ; handle
    LDI r7, PROCBUF      ; dest buffer
    LDI r9, BUFSIZE      ; max bytes
    FSREAD r8, r7, r9
    ; r15 = bytes read

    LDI r2, 0xFFFFFFFF
    CMP r15, r2
    JZ r15, meminfo_close

    ; Store bytes read
    LDI r20, BYTESRD
    STORE r20, r15

    ; Close file
    LDI r20, HANDLE
    LOAD r8, r20
    FSCLOSE r8

    ; Parse MemTotal from the buffer
    ; We'll scan for "MemTotal:" and extract the number
    LDI r0, PROCBUF     ; buffer start
    LDI r14, 0           ; position
    LDI r13, 0           ; found flag

    ; Scan for "MemTotal:"
scan_memtotal:
    ; Check if we've read enough
    LDI r20, BYTESRD
    LOAD r2, r20
    LDI r16, 9           ; "MemTotal:" is 9 chars
    ADD r16, r14
    CMP r16, r2
    BGE r15, scan_done_mt

    ; Check if current position starts with "MemTotal:"
    MOV r20, r0
    ADD r20, r14
    LOAD r4, r20        ; char at position
    LDI r2, 77          ; 'M'
    CMP r4, r2
    JNZ r15, scan_next_mt

    ; Check next char 'e'
    LDI r2, 1
    ADD r20, r2
    LOAD r4, r20
    LDI r2, 101         ; 'e'
    CMP r4, r2
    JNZ r15, scan_next_mt

    ; Check 'm'
    LDI r2, 2
    MOV r16, r0
    ADD r16, r14
    ADD r16, r2
    LOAD r4, r16
    LDI r2, 109         ; 'm'
    CMP r4, r2
    JNZ r15, scan_next_mt

    ; Found "Mem" - assume MemTotal. Skip to number after ":"
    MOV r20, r0
    ADD r20, r14
    LDI r2, 9           ; skip "MemTotal:"
    ADD r20, r2
    ; Skip spaces
skip_spaces_mt:
    LOAD r4, r20
    LDI r2, 32          ; space
    CMP r4, r2
    JNZ r15, parse_num_mt
    LDI r2, 1
    ADD r20, r2
    JMP skip_spaces_mt

parse_num_mt:
    ; Parse decimal number at r20 into r4
    LDI r4, 0           ; accumulated number
parse_digit_mt:
    PUSH r20
    LOAD r2, r20        ; char
    LDI r16, 48          ; '0'
    CMP r2, r16
    BLT r15, parse_done_mt
    LDI r16, 57          ; '9'
    CMP r2, r16
    BGE r15, parse_next_chk_mt
    JMP parse_done_mt
parse_next_chk_mt:
    ; digit = char - '0'
    LDI r16, 48
    SUB r2, r16
    ; result = result * 10 + digit
    LDI r16, 10
    MUL r4, r16
    ADD r4, r2
    POP r20
    LDI r2, 1
    ADD r20, r2
    JMP parse_digit_mt

parse_done_mt:
    POP r20
    LDI r13, 1           ; found flag
    JMP scan_done_mt

scan_next_mt:
    LDI r2, 1
    ADD r14, r2
    JMP scan_memtotal

scan_done_mt:
    ; Display MemTotal if found
    CMP r13, r15          ; r15 is 0 from CMP
    LDI r2, 0
    CMP r13, r2
    JZ r15, show_meminfo_err

    ; r4 has MemTotal in kB. Display as MB: divide by 1024
    LDI r2, 1024
    DIV r4, r2

    LDI r20, BUF
    STRO r20, "Total RAM"
    LDI r8, 136
    LDI r7, 48
    LDI r9, BUF
    LDI r3, COL_LABEL
    LDI r12, 0
    DRAWTEXT r8, r7, r9, r3, r12

    LDI r20, NUMBUF
    CALL int_to_str
    LDI r8, 200
    LDI r7, 48
    LDI r9, NUMBUF
    LDI r3, COL_GREEN
    LDI r12, 0
    DRAWTEXT r8, r7, r9, r3, r12

    LDI r20, BUF
    STRO r20, "MB"
    LDI r8, 232
    LDI r7, 48
    LDI r9, BUF
    LDI r3, COL_GREEN
    LDI r12, 0
    DRAWTEXT r8, r7, r9, r3, r12

    ; Memory bar (visual indicator)
    LDI r8, 136
    LDI r7, 62
    LDI r9, 112
    LDI r3, 10
    LDI r12, COL_BAR_BG
    RECTF r8, r7, r9, r3, r12

    ; Fill bar proportional (assume r4 is MB, max ~16GB=16384MB)
    ; bar_width = r4 * 112 / 16384
    LDI r2, 112
    MUL r4, r2
    LDI r2, 16384
    DIV r4, r2
    ; Cap at 112
    LDI r2, 112
    CMP r4, r2
    BLT r15, draw_bar
    MOV r4, r2

draw_bar:
    LDI r8, 136
    LDI r7, 62
    MOV r9, r4
    LDI r3, 10
    LDI r12, COL_BAR_FG
    RECTF r8, r7, r9, r3, r12

    JMP host_panel_done

show_meminfo_err:
meminfo_error:
    LDI r20, BUF
    STRO r20, "Cannot read"
    LDI r8, 136
    LDI r7, 48
    LDI r9, BUF
    LDI r3, COL_YELLOW
    LDI r12, 0
    DRAWTEXT r8, r7, r9, r3, r12

    LDI r20, BUF
    STRO r20, "/proc/meminfo"
    LDI r8, 136
    LDI r7, 62
    LDI r9, BUF
    LDI r3, COL_YELLOW
    LDI r12, 0
    DRAWTEXT r8, r7, r9, r3, r12

meminfo_close:
    ; Try to close if we have a handle
    LDI r20, HANDLE
    LOAD r2, r20
    LDI r16, 0xFFFFFFFF
    CMP r2, r16
    JZ r15, host_panel_done
    MOV r8, r2
    FSCLOSE r8

host_panel_done:
    ; ---- Bottom panel: VM internals ----
    LDI r8, 4
    LDI r7, 134
    LDI r9, 248
    LDI r3, 50
    LDI r12, COL_DARK
    RECTF r8, r7, r9, r3, r12

    LDI r20, BUF
    STRO r20, "VM Registers"
    LDI r8, 8
    LDI r7, 136
    LDI r9, BUF
    LDI r3, COL_CYAN
    LDI r12, COL_DARK
    DRAWTEXT r8, r7, r9, r3, r12

    ; Show current PC
    LDI r20, BUF
    STRO r20, "PC"
    LDI r8, 8
    LDI r7, 152
    LDI r9, BUF
    LDI r3, COL_LABEL
    LDI r12, 0
    DRAWTEXT r8, r7, r9, r3, r12

    ; Display via PROCINFO (main process, field=1=PC)
    LDI r8, 0            ; PID 0
    LDI r7, 1            ; field = PC
    PROCINFO r8, r7
    MOV r4, r15
    LDI r20, NUMBUF
    CALL hex_to_str
    LDI r8, 40
    LDI r7, 152
    LDI r9, NUMBUF
    LDI r3, COL_GREEN
    LDI r12, 0
    DRAWTEXT r8, r7, r9, r3, r12

    ; Show opcode histogram top entry
    LDI r20, BUF
    STRO r20, "VM Status: Running"
    LDI r8, 80
    LDI r7, 152
    LDI r9, BUF
    LDI r3, COL_GREEN
    LDI r12, 0
    DRAWTEXT r8, r7, r9, r3, r12

    ; ---- Footer ----
    LDI r8, 0
    LDI r7, 236
    LDI r9, 256
    LDI r3, 20
    LDI r12, COL_TITLE
    RECTF r8, r7, r9, r3, r12

    LDI r20, BUF
    STRO r20, "Geometry OS v1.0  |  Q:Quit"
    LDI r8, 24
    LDI r7, 242
    LDI r9, BUF
    LDI r3, COL_GRAY
    LDI r12, COL_TITLE
    DRAWTEXT r8, r7, r9, r3, r12

    ; Handle input
    IKEY r2
    JZ r2, no_input
    LDI r16, 81          ; 'Q'
    CMP r2, r16
    JNZ r15, no_input
    HALT

no_input:
    FRAME
    JMP main_loop


; =========================================
; int_to_str subroutine
; Converts r4 (u32) to decimal string at r20
; Returns null-terminated string. r15 = start address.
; =========================================
int_to_str:
    PUSH r31
    PUSH r20
    LDI r16, 0

    JZ r4, its_zero

its_loop:
    MOV r18, r4
    LDI r17, 10
    MOD r18, r17
    LDI r19, 48
    ADD r18, r19
    PUSH r18
    LDI r17, 10
    DIV r4, r17
    LDI r19, 1
    ADD r16, r19
    JNZ r4, its_loop

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
    POP r15
    POP r31
    RET

its_zero:
    LDI r18, 48
    STORE r20, r18
    LDI r19, 1
    ADD r20, r19
    LDI r18, 0
    STORE r20, r18
    POP r15
    POP r31
    RET

; =========================================
; hex_to_str subroutine
; Converts r4 (u32) to hex string "0x" prefix at r20
; Returns null-terminated. r15 = start address.
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
    MOV r18, r4
    LDI r19, 28
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r4
    LDI r19, 24
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r4
    LDI r19, 20
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r4
    LDI r19, 16
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r4
    LDI r19, 12
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r4
    LDI r19, 8
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r4
    LDI r19, 4
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r4
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    LDI r18, 0
    STORE r20, r18
    POP r15
    POP r31
    RET

hex_nibble_s:
    PUSH r31
    LDI r19, 10
    CMP r18, r19
    BGE r15, hex_alpha_s
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
