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
LDI r6, 1

; =========================================
; Main loop
; =========================================
main_loop:
    LDI r6, COL_BG
    FILL r6

    ; Title bar
    LDI r6, 0
    LDI r10, 0
    LDI r4, 256
    LDI r11, 22
    LDI r9, COL_TITLE
    RECTF r6, r10, r4, r11, r9

    LDI r20, BUF
    STRO r20, "System Dashboard"
    LDI r6, 60
    LDI r10, 5
    LDI r4, BUF
    LDI r11, COL_FG
    LDI r9, COL_TITLE
    DRAWTEXT r6, r10, r4, r11, r9

    ; ---- GeOS Status Panel (left side) ----
    LDI r6, 4
    LDI r10, 28
    LDI r4, 124
    LDI r11, 100
    LDI r9, COL_PANEL
    RECTF r6, r10, r4, r11, r9

    ; Panel title
    LDI r20, BUF
    STRO r20, "GeOS Status"
    LDI r6, 8
    LDI r10, 30
    LDI r4, BUF
    LDI r11, COL_CYAN
    LDI r9, COL_PANEL
    DRAWTEXT r6, r10, r4, r11, r9

    ; Separator
    LDI r6, 8
    LDI r10, 42
    LDI r4, 116
    LDI r11, 1
    LDI r9, COL_GRAY
    RECTF r6, r10, r4, r11, r9

    ; Process count
    LDI r20, BUF
    STRO r20, "Processes"
    LDI r6, 8
    LDI r10, 48
    LDI r4, BUF
    LDI r11, COL_LABEL
    LDI r9, 0
    DRAWTEXT r6, r10, r4, r11, r9

    NPROC
    MOV r8, r14
    LDI r20, NUMBUF
    CALL int_to_str
    LDI r6, 90
    LDI r10, 48
    LDI r4, NUMBUF
    LDI r11, COL_GREEN
    LDI r9, 0
    DRAWTEXT r6, r10, r4, r11, r9

    ; Frame count (uptime)
    LDI r20, BUF
    STRO r20, "Frames"
    LDI r6, 8
    LDI r10, 62
    LDI r4, BUF
    LDI r11, COL_LABEL
    LDI r9, 0
    DRAWTEXT r6, r10, r4, r11, r9

    LDI r20, TICKS
    LOAD r8, r20
    LDI r20, NUMBUF
    CALL int_to_str
    LDI r6, 90
    LDI r10, 62
    LDI r4, NUMBUF
    LDI r11, COL_GREEN
    LDI r9, 0
    DRAWTEXT r6, r10, r4, r11, r9

    ; RAM Size
    LDI r20, BUF
    STRO r20, "RAM"
    LDI r6, 8
    LDI r10, 76
    LDI r4, BUF
    LDI r11, COL_LABEL
    LDI r9, 0
    DRAWTEXT r6, r10, r4, r11, r9

    LDI r20, BUF
    STRO r20, "64K x u32"
    LDI r6, 60
    LDI r10, 76
    LDI r4, BUF
    LDI r11, COL_FG
    LDI r9, 0
    DRAWTEXT r6, r10, r4, r11, r9

    ; Screen
    LDI r20, BUF
    STRO r20, "Screen"
    LDI r6, 8
    LDI r10, 90
    LDI r4, BUF
    LDI r11, COL_LABEL
    LDI r9, 0
    DRAWTEXT r6, r10, r4, r11, r9

    LDI r20, BUF
    STRO r20, "256x256"
    LDI r6, 60
    LDI r10, 90
    LDI r4, BUF
    LDI r11, COL_FG
    LDI r9, 0
    DRAWTEXT r6, r10, r4, r11, r9

    ; Opcodes
    LDI r20, BUF
    STRO r20, "Opcodes"
    LDI r6, 8
    LDI r10, 104
    LDI r4, BUF
    LDI r11, COL_LABEL
    LDI r9, 0
    DRAWTEXT r6, r10, r4, r11, r9

    LDI r20, BUF
    STRO r20, "150+"
    LDI r6, 60
    LDI r10, 104
    LDI r4, BUF
    LDI r11, COL_AMBER
    LDI r9, 0
    DRAWTEXT r6, r10, r4, r11, r9

    ; ---- Host Memory Panel (right side) ----
    LDI r6, 132
    LDI r10, 28
    LDI r4, 120
    LDI r11, 100
    LDI r9, COL_PANEL
    RECTF r6, r10, r4, r11, r9

    LDI r20, BUF
    STRO r20, "Host Memory"
    LDI r6, 136
    LDI r10, 30
    LDI r4, BUF
    LDI r11, COL_CYAN
    LDI r9, COL_PANEL
    DRAWTEXT r6, r10, r4, r11, r9

    ; Separator
    LDI r6, 136
    LDI r10, 42
    LDI r4, 112
    LDI r11, 1
    LDI r9, COL_GRAY
    RECTF r6, r10, r4, r11, r9

    ; Try to read /proc/meminfo
    ; First write the path "/proc/meminfo" into RAM
    LDI r20, BUF
    STRO r20, "/proc/meminfo"

    ; FSOPEN path_reg, mode_reg (0=read)
    LDI r6, BUF
    LDI r10, 0           ; mode = read
    FSOPEN r6, r10
    ; r14 = handle or 0xFFFFFFFF on error
    LDI r5, 0xFFFFFFFF
    CMP r14, r5
    JZ r14, meminfo_error

    ; Store handle
    LDI r20, HANDLE
    STORE r20, r14

    ; FSREAD handle_reg, buf_reg, len_reg
    LDI r20, HANDLE
    LOAD r6, r20         ; handle
    LDI r10, PROCBUF      ; dest buffer
    LDI r4, BUFSIZE      ; max bytes
    FSREAD r6, r10, r4
    ; r14 = bytes read

    LDI r5, 0xFFFFFFFF
    CMP r14, r5
    JZ r14, meminfo_close

    ; Store bytes read
    LDI r20, BYTESRD
    STORE r20, r14

    ; Close file
    LDI r20, HANDLE
    LOAD r6, r20
    FSCLOSE r6

    ; Parse MemTotal from the buffer
    ; We'll scan for "MemTotal:" and extract the number
    LDI r0, PROCBUF     ; buffer start
    LDI r15, 0           ; position
    LDI r3, 0           ; found flag

    ; Scan for "MemTotal:"
scan_memtotal:
    ; Check if we've read enough
    LDI r20, BYTESRD
    LOAD r5, r20
    LDI r16, 9           ; "MemTotal:" is 9 chars
    ADD r16, r15
    CMP r16, r5
    BGE r14, scan_done_mt

    ; Check if current position starts with "MemTotal:"
    MOV r20, r0
    ADD r20, r15
    LOAD r8, r20        ; char at position
    LDI r5, 77          ; 'M'
    CMP r8, r5
    JNZ r14, scan_next_mt

    ; Check next char 'e'
    LDI r5, 1
    ADD r20, r5
    LOAD r8, r20
    LDI r5, 101         ; 'e'
    CMP r8, r5
    JNZ r14, scan_next_mt

    ; Check 'm'
    LDI r5, 2
    MOV r16, r0
    ADD r16, r15
    ADD r16, r5
    LOAD r8, r16
    LDI r5, 109         ; 'm'
    CMP r8, r5
    JNZ r14, scan_next_mt

    ; Found "Mem" - assume MemTotal. Skip to number after ":"
    MOV r20, r0
    ADD r20, r15
    LDI r5, 9           ; skip "MemTotal:"
    ADD r20, r5
    ; Skip spaces
skip_spaces_mt:
    LOAD r8, r20
    LDI r5, 32          ; space
    CMP r8, r5
    JNZ r14, parse_num_mt
    LDI r5, 1
    ADD r20, r5
    JMP skip_spaces_mt

parse_num_mt:
    ; Parse decimal number at r20 into r8
    LDI r8, 0           ; accumulated number
parse_digit_mt:
    PUSH r20
    LOAD r5, r20        ; char
    LDI r16, 48          ; '0'
    CMP r5, r16
    BLT r14, parse_done_mt
    LDI r16, 57          ; '9'
    CMP r5, r16
    BGE r14, parse_next_chk_mt
    JMP parse_done_mt
parse_next_chk_mt:
    ; digit = char - '0'
    LDI r16, 48
    SUB r5, r16
    ; result = result * 10 + digit
    LDI r16, 10
    MUL r8, r16
    ADD r8, r5
    POP r20
    LDI r5, 1
    ADD r20, r5
    JMP parse_digit_mt

parse_done_mt:
    POP r20
    LDI r3, 1           ; found flag
    JMP scan_done_mt

scan_next_mt:
    LDI r5, 1
    ADD r15, r5
    JMP scan_memtotal

scan_done_mt:
    ; Display MemTotal if found
    CMP r3, r14          ; r14 is 0 from CMP
    LDI r5, 0
    CMP r3, r5
    JZ r14, show_meminfo_err

    ; r8 has MemTotal in kB. Display as MB: divide by 1024
    LDI r5, 1024
    DIV r8, r5

    LDI r20, BUF
    STRO r20, "Total RAM"
    LDI r6, 136
    LDI r10, 48
    LDI r4, BUF
    LDI r11, COL_LABEL
    LDI r9, 0
    DRAWTEXT r6, r10, r4, r11, r9

    LDI r20, NUMBUF
    CALL int_to_str
    LDI r6, 200
    LDI r10, 48
    LDI r4, NUMBUF
    LDI r11, COL_GREEN
    LDI r9, 0
    DRAWTEXT r6, r10, r4, r11, r9

    LDI r20, BUF
    STRO r20, "MB"
    LDI r6, 232
    LDI r10, 48
    LDI r4, BUF
    LDI r11, COL_GREEN
    LDI r9, 0
    DRAWTEXT r6, r10, r4, r11, r9

    ; Memory bar (visual indicator)
    LDI r6, 136
    LDI r10, 62
    LDI r4, 112
    LDI r11, 10
    LDI r9, COL_BAR_BG
    RECTF r6, r10, r4, r11, r9

    ; Fill bar proportional (assume r8 is MB, max ~16GB=16384MB)
    ; bar_width = r8 * 112 / 16384
    LDI r5, 112
    MUL r8, r5
    LDI r5, 16384
    DIV r8, r5
    ; Cap at 112
    LDI r5, 112
    CMP r8, r5
    BLT r14, draw_bar
    MOV r8, r5

draw_bar:
    LDI r6, 136
    LDI r10, 62
    MOV r4, r8
    LDI r11, 10
    LDI r9, COL_BAR_FG
    RECTF r6, r10, r4, r11, r9

    JMP host_panel_done

show_meminfo_err:
meminfo_error:
    LDI r20, BUF
    STRO r20, "Cannot read"
    LDI r6, 136
    LDI r10, 48
    LDI r4, BUF
    LDI r11, COL_YELLOW
    LDI r9, 0
    DRAWTEXT r6, r10, r4, r11, r9

    LDI r20, BUF
    STRO r20, "/proc/meminfo"
    LDI r6, 136
    LDI r10, 62
    LDI r4, BUF
    LDI r11, COL_YELLOW
    LDI r9, 0
    DRAWTEXT r6, r10, r4, r11, r9

meminfo_close:
    ; Try to close if we have a handle
    LDI r20, HANDLE
    LOAD r5, r20
    LDI r16, 0xFFFFFFFF
    CMP r5, r16
    JZ r14, host_panel_done
    MOV r6, r5
    FSCLOSE r6

host_panel_done:
    ; ---- Bottom panel: VM internals ----
    LDI r6, 4
    LDI r10, 134
    LDI r4, 248
    LDI r11, 50
    LDI r9, COL_DARK
    RECTF r6, r10, r4, r11, r9

    LDI r20, BUF
    STRO r20, "VM Registers"
    LDI r6, 8
    LDI r10, 136
    LDI r4, BUF
    LDI r11, COL_CYAN
    LDI r9, COL_DARK
    DRAWTEXT r6, r10, r4, r11, r9

    ; Show current PC
    LDI r20, BUF
    STRO r20, "PC"
    LDI r6, 8
    LDI r10, 152
    LDI r4, BUF
    LDI r11, COL_LABEL
    LDI r9, 0
    DRAWTEXT r6, r10, r4, r11, r9

    ; Display via PROCINFO (main process, field=1=PC)
    LDI r6, 0            ; PID 0
    LDI r10, 1            ; field = PC
    PROCINFO r6, r10
    MOV r8, r14
    LDI r20, NUMBUF
    CALL hex_to_str
    LDI r6, 40
    LDI r10, 152
    LDI r4, NUMBUF
    LDI r11, COL_GREEN
    LDI r9, 0
    DRAWTEXT r6, r10, r4, r11, r9

    ; Show opcode histogram top entry
    LDI r20, BUF
    STRO r20, "VM Status: Running"
    LDI r6, 80
    LDI r10, 152
    LDI r4, BUF
    LDI r11, COL_GREEN
    LDI r9, 0
    DRAWTEXT r6, r10, r4, r11, r9

    ; ---- Footer ----
    LDI r6, 0
    LDI r10, 236
    LDI r4, 256
    LDI r11, 20
    LDI r9, COL_TITLE
    RECTF r6, r10, r4, r11, r9

    LDI r20, BUF
    STRO r20, "Geometry OS v1.0  |  Q:Quit"
    LDI r6, 24
    LDI r10, 242
    LDI r4, BUF
    LDI r11, COL_GRAY
    LDI r9, COL_TITLE
    DRAWTEXT r6, r10, r4, r11, r9

    ; Handle input
    IKEY r5
    JZ r5, no_input
    LDI r16, 81          ; 'Q'
    CMP r5, r16
    JNZ r14, no_input
    HALT

no_input:
    FRAME
    JMP main_loop


; =========================================
; int_to_str subroutine
; Converts r8 (u32) to decimal string at r20
; Returns null-terminated string. r14 = start address.
; =========================================
int_to_str:
    PUSH r31
    PUSH r20
    LDI r16, 0

    JZ r8, its_zero

its_loop:
    MOV r18, r8
    LDI r17, 10
    MOD r18, r17
    LDI r19, 48
    ADD r18, r19
    PUSH r18
    LDI r17, 10
    DIV r8, r17
    LDI r19, 1
    ADD r16, r19
    JNZ r8, its_loop

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
    POP r14
    POP r31
    RET

its_zero:
    LDI r18, 48
    STORE r20, r18
    LDI r19, 1
    ADD r20, r19
    LDI r18, 0
    STORE r20, r18
    POP r14
    POP r31
    RET

; =========================================
; hex_to_str subroutine
; Converts r8 (u32) to hex string "0x" prefix at r20
; Returns null-terminated. r14 = start address.
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
    MOV r18, r8
    LDI r19, 28
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r8
    LDI r19, 24
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r8
    LDI r19, 20
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r8
    LDI r19, 16
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r8
    LDI r19, 12
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r8
    LDI r19, 8
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r8
    LDI r19, 4
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r8
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    LDI r18, 0
    STORE r20, r18
    POP r14
    POP r31
    RET

hex_nibble_s:
    PUSH r31
    LDI r19, 10
    CMP r18, r19
    BGE r14, hex_alpha_s
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
