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
LDI r1, 1

; =========================================
; Main loop
; =========================================
main_loop:
    LDI r1, COL_BG
    FILL r1

    ; Title bar
    LDI r1, 0
    LDI r10, 0
    LDI r6, 256
    LDI r3, 22
    LDI r14, COL_TITLE
    RECTF r1, r10, r6, r3, r14

    LDI r20, BUF
    STRO r20, "System Dashboard"
    LDI r1, 60
    LDI r10, 5
    LDI r6, BUF
    LDI r3, COL_FG
    LDI r14, COL_TITLE
    DRAWTEXT r1, r10, r6, r3, r14

    ; ---- GeOS Status Panel (left side) ----
    LDI r1, 4
    LDI r10, 28
    LDI r6, 124
    LDI r3, 100
    LDI r14, COL_PANEL
    RECTF r1, r10, r6, r3, r14

    ; Panel title
    LDI r20, BUF
    STRO r20, "GeOS Status"
    LDI r1, 8
    LDI r10, 30
    LDI r6, BUF
    LDI r3, COL_CYAN
    LDI r14, COL_PANEL
    DRAWTEXT r1, r10, r6, r3, r14

    ; Separator
    LDI r1, 8
    LDI r10, 42
    LDI r6, 116
    LDI r3, 1
    LDI r14, COL_GRAY
    RECTF r1, r10, r6, r3, r14

    ; Process count
    LDI r20, BUF
    STRO r20, "Processes"
    LDI r1, 8
    LDI r10, 48
    LDI r6, BUF
    LDI r3, COL_LABEL
    LDI r14, 0
    DRAWTEXT r1, r10, r6, r3, r14

    NPROC
    MOV r8, r7
    LDI r20, NUMBUF
    CALL int_to_str
    LDI r1, 90
    LDI r10, 48
    LDI r6, NUMBUF
    LDI r3, COL_GREEN
    LDI r14, 0
    DRAWTEXT r1, r10, r6, r3, r14

    ; Frame count (uptime)
    LDI r20, BUF
    STRO r20, "Frames"
    LDI r1, 8
    LDI r10, 62
    LDI r6, BUF
    LDI r3, COL_LABEL
    LDI r14, 0
    DRAWTEXT r1, r10, r6, r3, r14

    LDI r20, TICKS
    LOAD r8, r20
    LDI r20, NUMBUF
    CALL int_to_str
    LDI r1, 90
    LDI r10, 62
    LDI r6, NUMBUF
    LDI r3, COL_GREEN
    LDI r14, 0
    DRAWTEXT r1, r10, r6, r3, r14

    ; RAM Size
    LDI r20, BUF
    STRO r20, "RAM"
    LDI r1, 8
    LDI r10, 76
    LDI r6, BUF
    LDI r3, COL_LABEL
    LDI r14, 0
    DRAWTEXT r1, r10, r6, r3, r14

    LDI r20, BUF
    STRO r20, "64K x u32"
    LDI r1, 60
    LDI r10, 76
    LDI r6, BUF
    LDI r3, COL_FG
    LDI r14, 0
    DRAWTEXT r1, r10, r6, r3, r14

    ; Screen
    LDI r20, BUF
    STRO r20, "Screen"
    LDI r1, 8
    LDI r10, 90
    LDI r6, BUF
    LDI r3, COL_LABEL
    LDI r14, 0
    DRAWTEXT r1, r10, r6, r3, r14

    LDI r20, BUF
    STRO r20, "256x256"
    LDI r1, 60
    LDI r10, 90
    LDI r6, BUF
    LDI r3, COL_FG
    LDI r14, 0
    DRAWTEXT r1, r10, r6, r3, r14

    ; Opcodes
    LDI r20, BUF
    STRO r20, "Opcodes"
    LDI r1, 8
    LDI r10, 104
    LDI r6, BUF
    LDI r3, COL_LABEL
    LDI r14, 0
    DRAWTEXT r1, r10, r6, r3, r14

    LDI r20, BUF
    STRO r20, "150+"
    LDI r1, 60
    LDI r10, 104
    LDI r6, BUF
    LDI r3, COL_AMBER
    LDI r14, 0
    DRAWTEXT r1, r10, r6, r3, r14

    ; ---- Host Memory Panel (right side) ----
    LDI r1, 132
    LDI r10, 28
    LDI r6, 120
    LDI r3, 100
    LDI r14, COL_PANEL
    RECTF r1, r10, r6, r3, r14

    LDI r20, BUF
    STRO r20, "Host Memory"
    LDI r1, 136
    LDI r10, 30
    LDI r6, BUF
    LDI r3, COL_CYAN
    LDI r14, COL_PANEL
    DRAWTEXT r1, r10, r6, r3, r14

    ; Separator
    LDI r1, 136
    LDI r10, 42
    LDI r6, 112
    LDI r3, 1
    LDI r14, COL_GRAY
    RECTF r1, r10, r6, r3, r14

    ; Try to read /proc/meminfo
    ; First write the path "/proc/meminfo" into RAM
    LDI r20, BUF
    STRO r20, "/proc/meminfo"

    ; FSOPEN path_reg, mode_reg (0=read)
    LDI r1, BUF
    LDI r10, 0           ; mode = read
    FSOPEN r1, r10
    ; r7 = handle or 0xFFFFFFFF on error
    LDI r12, 0xFFFFFFFF
    CMP r7, r12
    JZ r7, meminfo_error

    ; Store handle
    LDI r20, HANDLE
    STORE r20, r7

    ; FSREAD handle_reg, buf_reg, len_reg
    LDI r20, HANDLE
    LOAD r1, r20         ; handle
    LDI r10, PROCBUF      ; dest buffer
    LDI r6, BUFSIZE      ; max bytes
    FSREAD r1, r10, r6
    ; r7 = bytes read

    LDI r12, 0xFFFFFFFF
    CMP r7, r12
    JZ r7, meminfo_close

    ; Store bytes read
    LDI r20, BYTESRD
    STORE r20, r7

    ; Close file
    LDI r20, HANDLE
    LOAD r1, r20
    FSCLOSE r1

    ; Parse MemTotal from the buffer
    ; We'll scan for "MemTotal:" and extract the number
    LDI r9, PROCBUF     ; buffer start
    LDI r2, 0           ; position
    LDI r4, 0           ; found flag

    ; Scan for "MemTotal:"
scan_memtotal:
    ; Check if we've read enough
    LDI r20, BYTESRD
    LOAD r12, r20
    LDI r16, 9           ; "MemTotal:" is 9 chars
    ADD r16, r2
    CMP r16, r12
    BGE r7, scan_done_mt

    ; Check if current position starts with "MemTotal:"
    MOV r20, r9
    ADD r20, r2
    LOAD r8, r20        ; char at position
    LDI r12, 77          ; 'M'
    CMP r8, r12
    JNZ r7, scan_next_mt

    ; Check next char 'e'
    LDI r12, 1
    ADD r20, r12
    LOAD r8, r20
    LDI r12, 101         ; 'e'
    CMP r8, r12
    JNZ r7, scan_next_mt

    ; Check 'm'
    LDI r12, 2
    MOV r16, r9
    ADD r16, r2
    ADD r16, r12
    LOAD r8, r16
    LDI r12, 109         ; 'm'
    CMP r8, r12
    JNZ r7, scan_next_mt

    ; Found "Mem" - assume MemTotal. Skip to number after ":"
    MOV r20, r9
    ADD r20, r2
    LDI r12, 9           ; skip "MemTotal:"
    ADD r20, r12
    ; Skip spaces
skip_spaces_mt:
    LOAD r8, r20
    LDI r12, 32          ; space
    CMP r8, r12
    JNZ r7, parse_num_mt
    LDI r12, 1
    ADD r20, r12
    JMP skip_spaces_mt

parse_num_mt:
    ; Parse decimal number at r20 into r8
    LDI r8, 0           ; accumulated number
parse_digit_mt:
    PUSH r20
    LOAD r12, r20        ; char
    LDI r16, 48          ; '0'
    CMP r12, r16
    BLT r7, parse_done_mt
    LDI r16, 57          ; '9'
    CMP r12, r16
    BGE r7, parse_next_chk_mt
    JMP parse_done_mt
parse_next_chk_mt:
    ; digit = char - '0'
    LDI r16, 48
    SUB r12, r16
    ; result = result * 10 + digit
    LDI r16, 10
    MUL r8, r16
    ADD r8, r12
    POP r20
    LDI r12, 1
    ADD r20, r12
    JMP parse_digit_mt

parse_done_mt:
    POP r20
    LDI r4, 1           ; found flag
    JMP scan_done_mt

scan_next_mt:
    LDI r12, 1
    ADD r2, r12
    JMP scan_memtotal

scan_done_mt:
    ; Display MemTotal if found
    CMP r4, r7          ; r7 is 0 from CMP
    LDI r12, 0
    CMP r4, r12
    JZ r7, show_meminfo_err

    ; r8 has MemTotal in kB. Display as MB: divide by 1024
    LDI r12, 1024
    DIV r8, r12

    LDI r20, BUF
    STRO r20, "Total RAM"
    LDI r1, 136
    LDI r10, 48
    LDI r6, BUF
    LDI r3, COL_LABEL
    LDI r14, 0
    DRAWTEXT r1, r10, r6, r3, r14

    LDI r20, NUMBUF
    CALL int_to_str
    LDI r1, 200
    LDI r10, 48
    LDI r6, NUMBUF
    LDI r3, COL_GREEN
    LDI r14, 0
    DRAWTEXT r1, r10, r6, r3, r14

    LDI r20, BUF
    STRO r20, "MB"
    LDI r1, 232
    LDI r10, 48
    LDI r6, BUF
    LDI r3, COL_GREEN
    LDI r14, 0
    DRAWTEXT r1, r10, r6, r3, r14

    ; Memory bar (visual indicator)
    LDI r1, 136
    LDI r10, 62
    LDI r6, 112
    LDI r3, 10
    LDI r14, COL_BAR_BG
    RECTF r1, r10, r6, r3, r14

    ; Fill bar proportional (assume r8 is MB, max ~16GB=16384MB)
    ; bar_width = r8 * 112 / 16384
    LDI r12, 112
    MUL r8, r12
    LDI r12, 16384
    DIV r8, r12
    ; Cap at 112
    LDI r12, 112
    CMP r8, r12
    BLT r7, draw_bar
    MOV r8, r12

draw_bar:
    LDI r1, 136
    LDI r10, 62
    MOV r6, r8
    LDI r3, 10
    LDI r14, COL_BAR_FG
    RECTF r1, r10, r6, r3, r14

    JMP host_panel_done

show_meminfo_err:
meminfo_error:
    LDI r20, BUF
    STRO r20, "Cannot read"
    LDI r1, 136
    LDI r10, 48
    LDI r6, BUF
    LDI r3, COL_YELLOW
    LDI r14, 0
    DRAWTEXT r1, r10, r6, r3, r14

    LDI r20, BUF
    STRO r20, "/proc/meminfo"
    LDI r1, 136
    LDI r10, 62
    LDI r6, BUF
    LDI r3, COL_YELLOW
    LDI r14, 0
    DRAWTEXT r1, r10, r6, r3, r14

meminfo_close:
    ; Try to close if we have a handle
    LDI r20, HANDLE
    LOAD r12, r20
    LDI r16, 0xFFFFFFFF
    CMP r12, r16
    JZ r7, host_panel_done
    MOV r1, r12
    FSCLOSE r1

host_panel_done:
    ; ---- Bottom panel: VM internals ----
    LDI r1, 4
    LDI r10, 134
    LDI r6, 248
    LDI r3, 50
    LDI r14, COL_DARK
    RECTF r1, r10, r6, r3, r14

    LDI r20, BUF
    STRO r20, "VM Registers"
    LDI r1, 8
    LDI r10, 136
    LDI r6, BUF
    LDI r3, COL_CYAN
    LDI r14, COL_DARK
    DRAWTEXT r1, r10, r6, r3, r14

    ; Show current PC
    LDI r20, BUF
    STRO r20, "PC"
    LDI r1, 8
    LDI r10, 152
    LDI r6, BUF
    LDI r3, COL_LABEL
    LDI r14, 0
    DRAWTEXT r1, r10, r6, r3, r14

    ; Display via PROCINFO (main process, field=1=PC)
    LDI r1, 0            ; PID 0
    LDI r10, 1            ; field = PC
    PROCINFO r1, r10
    MOV r8, r7
    LDI r20, NUMBUF
    CALL hex_to_str
    LDI r1, 40
    LDI r10, 152
    LDI r6, NUMBUF
    LDI r3, COL_GREEN
    LDI r14, 0
    DRAWTEXT r1, r10, r6, r3, r14

    ; Show opcode histogram top entry
    LDI r20, BUF
    STRO r20, "VM Status: Running"
    LDI r1, 80
    LDI r10, 152
    LDI r6, BUF
    LDI r3, COL_GREEN
    LDI r14, 0
    DRAWTEXT r1, r10, r6, r3, r14

    ; ---- Footer ----
    LDI r1, 0
    LDI r10, 236
    LDI r6, 256
    LDI r3, 20
    LDI r14, COL_TITLE
    RECTF r1, r10, r6, r3, r14

    LDI r20, BUF
    STRO r20, "Geometry OS v1.0  |  Q:Quit"
    LDI r1, 24
    LDI r10, 242
    LDI r6, BUF
    LDI r3, COL_GRAY
    LDI r14, COL_TITLE
    DRAWTEXT r1, r10, r6, r3, r14

    ; Handle input
    IKEY r12
    JZ r12, no_input
    LDI r16, 81          ; 'Q'
    CMP r12, r16
    JNZ r7, no_input
    HALT

no_input:
    FRAME
    JMP main_loop


; =========================================
; int_to_str subroutine
; Converts r8 (u32) to decimal string at r20
; Returns null-terminated string. r7 = start address.
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
    POP r7
    POP r31
    RET

its_zero:
    LDI r18, 48
    STORE r20, r18
    LDI r19, 1
    ADD r20, r19
    LDI r18, 0
    STORE r20, r18
    POP r7
    POP r31
    RET

; =========================================
; hex_to_str subroutine
; Converts r8 (u32) to hex string "0x" prefix at r20
; Returns null-terminated. r7 = start address.
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
    POP r7
    POP r31
    RET

hex_nibble_s:
    PUSH r31
    LDI r19, 10
    CMP r18, r19
    BGE r7, hex_alpha_s
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
