; DESCRIPTION: Geometry OS program to draw a colored object.

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
    LDI r9, 0
    LDI r2, 256
    LDI r15, 22
    LDI r5, COL_TITLE
    RECTF r6, r9, r2, r15, r5

    LDI r20, BUF
    STRO r20, "System Dashboard"
    LDI r6, 60
    LDI r9, 5
    LDI r2, BUF
    LDI r15, COL_FG
    LDI r5, COL_TITLE
    DRAWTEXT r6, r9, r2, r15, r5

    ; ---- GeOS Status Panel (left side) ----
    LDI r6, 4
    LDI r9, 28
    LDI r2, 124
    LDI r15, 100
    LDI r5, COL_PANEL
    RECTF r6, r9, r2, r15, r5

    ; Panel title
    LDI r20, BUF
    STRO r20, "GeOS Status"
    LDI r6, 8
    LDI r9, 30
    LDI r2, BUF
    LDI r15, COL_CYAN
    LDI r5, COL_PANEL
    DRAWTEXT r6, r9, r2, r15, r5

    ; Separator
    LDI r6, 8
    LDI r9, 42
    LDI r2, 116
    LDI r15, 1
    LDI r5, COL_GRAY
    RECTF r6, r9, r2, r15, r5

    ; Process count
    LDI r20, BUF
    STRO r20, "Processes"
    LDI r6, 8
    LDI r9, 48
    LDI r2, BUF
    LDI r15, COL_LABEL
    LDI r5, 0
    DRAWTEXT r6, r9, r2, r15, r5

    NPROC
    MOV r1, r12
    LDI r20, NUMBUF
    CALL int_to_str
    LDI r6, 90
    LDI r9, 48
    LDI r2, NUMBUF
    LDI r15, COL_GREEN
    LDI r5, 0
    DRAWTEXT r6, r9, r2, r15, r5

    ; Frame count (uptime)
    LDI r20, BUF
    STRO r20, "Frames"
    LDI r6, 8
    LDI r9, 62
    LDI r2, BUF
    LDI r15, COL_LABEL
    LDI r5, 0
    DRAWTEXT r6, r9, r2, r15, r5

    LDI r20, TICKS
    LOAD r1, r20
    LDI r20, NUMBUF
    CALL int_to_str
    LDI r6, 90
    LDI r9, 62
    LDI r2, NUMBUF
    LDI r15, COL_GREEN
    LDI r5, 0
    DRAWTEXT r6, r9, r2, r15, r5

    ; RAM Size
    LDI r20, BUF
    STRO r20, "RAM"
    LDI r6, 8
    LDI r9, 76
    LDI r2, BUF
    LDI r15, COL_LABEL
    LDI r5, 0
    DRAWTEXT r6, r9, r2, r15, r5

    LDI r20, BUF
    STRO r20, "64K x u32"
    LDI r6, 60
    LDI r9, 76
    LDI r2, BUF
    LDI r15, COL_FG
    LDI r5, 0
    DRAWTEXT r6, r9, r2, r15, r5

    ; Screen
    LDI r20, BUF
    STRO r20, "Screen"
    LDI r6, 8
    LDI r9, 90
    LDI r2, BUF
    LDI r15, COL_LABEL
    LDI r5, 0
    DRAWTEXT r6, r9, r2, r15, r5

    LDI r20, BUF
    STRO r20, "256x256"
    LDI r6, 60
    LDI r9, 90
    LDI r2, BUF
    LDI r15, COL_FG
    LDI r5, 0
    DRAWTEXT r6, r9, r2, r15, r5

    ; Opcodes
    LDI r20, BUF
    STRO r20, "Opcodes"
    LDI r6, 8
    LDI r9, 104
    LDI r2, BUF
    LDI r15, COL_LABEL
    LDI r5, 0
    DRAWTEXT r6, r9, r2, r15, r5

    LDI r20, BUF
    STRO r20, "150+"
    LDI r6, 60
    LDI r9, 104
    LDI r2, BUF
    LDI r15, COL_AMBER
    LDI r5, 0
    DRAWTEXT r6, r9, r2, r15, r5

    ; ---- Host Memory Panel (right side) ----
    LDI r6, 132
    LDI r9, 28
    LDI r2, 120
    LDI r15, 100
    LDI r5, COL_PANEL
    RECTF r6, r9, r2, r15, r5

    LDI r20, BUF
    STRO r20, "Host Memory"
    LDI r6, 136
    LDI r9, 30
    LDI r2, BUF
    LDI r15, COL_CYAN
    LDI r5, COL_PANEL
    DRAWTEXT r6, r9, r2, r15, r5

    ; Separator
    LDI r6, 136
    LDI r9, 42
    LDI r2, 112
    LDI r15, 1
    LDI r5, COL_GRAY
    RECTF r6, r9, r2, r15, r5

    ; Try to read /proc/meminfo
    ; First write the path "/proc/meminfo" into RAM
    LDI r20, BUF
    STRO r20, "/proc/meminfo"

    ; FSOPEN path_reg, mode_reg (0=read)
    LDI r6, BUF
    LDI r9, 0           ; mode = read
    FSOPEN r6, r9
    ; r12 = handle or 0xFFFFFFFF on error
    LDI r11, 0xFFFFFFFF
    CMP r12, r11
    JZ r12, meminfo_error

    ; Store handle
    LDI r20, HANDLE
    STORE r20, r12

    ; FSREAD handle_reg, buf_reg, len_reg
    LDI r20, HANDLE
    LOAD r6, r20         ; handle
    LDI r9, PROCBUF      ; dest buffer
    LDI r2, BUFSIZE      ; max bytes
    FSREAD r6, r9, r2
    ; r12 = bytes read

    LDI r11, 0xFFFFFFFF
    CMP r12, r11
    JZ r12, meminfo_close

    ; Store bytes read
    LDI r20, BYTESRD
    STORE r20, r12

    ; Close file
    LDI r20, HANDLE
    LOAD r6, r20
    FSCLOSE r6

    ; Parse MemTotal from the buffer
    ; We'll scan for "MemTotal:" and extract the number
    LDI r3, PROCBUF     ; buffer start
    LDI r0, 0           ; position
    LDI r10, 0           ; found flag

    ; Scan for "MemTotal:"
scan_memtotal:
    ; Check if we've read enough
    LDI r20, BYTESRD
    LOAD r11, r20
    LDI r16, 9           ; "MemTotal:" is 9 chars
    ADD r16, r0
    CMP r16, r11
    BGE r12, scan_done_mt

    ; Check if current position starts with "MemTotal:"
    MOV r20, r3
    ADD r20, r0
    LOAD r1, r20        ; char at position
    LDI r11, 77          ; 'M'
    CMP r1, r11
    JNZ r12, scan_next_mt

    ; Check next char 'e'
    LDI r11, 1
    ADD r20, r11
    LOAD r1, r20
    LDI r11, 101         ; 'e'
    CMP r1, r11
    JNZ r12, scan_next_mt

    ; Check 'm'
    LDI r11, 2
    MOV r16, r3
    ADD r16, r0
    ADD r16, r11
    LOAD r1, r16
    LDI r11, 109         ; 'm'
    CMP r1, r11
    JNZ r12, scan_next_mt

    ; Found "Mem" - assume MemTotal. Skip to number after ":"
    MOV r20, r3
    ADD r20, r0
    LDI r11, 9           ; skip "MemTotal:"
    ADD r20, r11
    ; Skip spaces
skip_spaces_mt:
    LOAD r1, r20
    LDI r11, 32          ; space
    CMP r1, r11
    JNZ r12, parse_num_mt
    LDI r11, 1
    ADD r20, r11
    JMP skip_spaces_mt

parse_num_mt:
    ; Parse decimal number at r20 into r1
    LDI r1, 0           ; accumulated number
parse_digit_mt:
    PUSH r20
    LOAD r11, r20        ; char
    LDI r16, 48          ; '0'
    CMP r11, r16
    BLT r12, parse_done_mt
    LDI r16, 57          ; '9'
    CMP r11, r16
    BGE r12, parse_next_chk_mt
    JMP parse_done_mt
parse_next_chk_mt:
    ; digit = char - '0'
    LDI r16, 48
    SUB r11, r16
    ; result = result * 10 + digit
    LDI r16, 10
    MUL r1, r16
    ADD r1, r11
    POP r20
    LDI r11, 1
    ADD r20, r11
    JMP parse_digit_mt

parse_done_mt:
    POP r20
    LDI r10, 1           ; found flag
    JMP scan_done_mt

scan_next_mt:
    LDI r11, 1
    ADD r0, r11
    JMP scan_memtotal

scan_done_mt:
    ; Display MemTotal if found
    CMP r10, r12          ; r12 is 0 from CMP
    LDI r11, 0
    CMP r10, r11
    JZ r12, show_meminfo_err

    ; r1 has MemTotal in kB. Display as MB: divide by 1024
    LDI r11, 1024
    DIV r1, r11

    LDI r20, BUF
    STRO r20, "Total RAM"
    LDI r6, 136
    LDI r9, 48
    LDI r2, BUF
    LDI r15, COL_LABEL
    LDI r5, 0
    DRAWTEXT r6, r9, r2, r15, r5

    LDI r20, NUMBUF
    CALL int_to_str
    LDI r6, 200
    LDI r9, 48
    LDI r2, NUMBUF
    LDI r15, COL_GREEN
    LDI r5, 0
    DRAWTEXT r6, r9, r2, r15, r5

    LDI r20, BUF
    STRO r20, "MB"
    LDI r6, 232
    LDI r9, 48
    LDI r2, BUF
    LDI r15, COL_GREEN
    LDI r5, 0
    DRAWTEXT r6, r9, r2, r15, r5

    ; Memory bar (visual indicator)
    LDI r6, 136
    LDI r9, 62
    LDI r2, 112
    LDI r15, 10
    LDI r5, COL_BAR_BG
    RECTF r6, r9, r2, r15, r5

    ; Fill bar proportional (assume r1 is MB, max ~16GB=16384MB)
    ; bar_width = r1 * 112 / 16384
    LDI r11, 112
    MUL r1, r11
    LDI r11, 16384
    DIV r1, r11
    ; Cap at 112
    LDI r11, 112
    CMP r1, r11
    BLT r12, draw_bar
    MOV r1, r11

draw_bar:
    LDI r6, 136
    LDI r9, 62
    MOV r2, r1
    LDI r15, 10
    LDI r5, COL_BAR_FG
    RECTF r6, r9, r2, r15, r5

    JMP host_panel_done

show_meminfo_err:
meminfo_error:
    LDI r20, BUF
    STRO r20, "Cannot read"
    LDI r6, 136
    LDI r9, 48
    LDI r2, BUF
    LDI r15, COL_YELLOW
    LDI r5, 0
    DRAWTEXT r6, r9, r2, r15, r5

    LDI r20, BUF
    STRO r20, "/proc/meminfo"
    LDI r6, 136
    LDI r9, 62
    LDI r2, BUF
    LDI r15, COL_YELLOW
    LDI r5, 0
    DRAWTEXT r6, r9, r2, r15, r5

meminfo_close:
    ; Try to close if we have a handle
    LDI r20, HANDLE
    LOAD r11, r20
    LDI r16, 0xFFFFFFFF
    CMP r11, r16
    JZ r12, host_panel_done
    MOV r6, r11
    FSCLOSE r6

host_panel_done:
    ; ---- Bottom panel: VM internals ----
    LDI r6, 4
    LDI r9, 134
    LDI r2, 248
    LDI r15, 50
    LDI r5, COL_DARK
    RECTF r6, r9, r2, r15, r5

    LDI r20, BUF
    STRO r20, "VM Registers"
    LDI r6, 8
    LDI r9, 136
    LDI r2, BUF
    LDI r15, COL_CYAN
    LDI r5, COL_DARK
    DRAWTEXT r6, r9, r2, r15, r5

    ; Show current PC
    LDI r20, BUF
    STRO r20, "PC"
    LDI r6, 8
    LDI r9, 152
    LDI r2, BUF
    LDI r15, COL_LABEL
    LDI r5, 0
    DRAWTEXT r6, r9, r2, r15, r5

    ; Display via PROCINFO (main process, field=1=PC)
    LDI r6, 0            ; PID 0
    LDI r9, 1            ; field = PC
    PROCINFO r6, r9
    MOV r1, r12
    LDI r20, NUMBUF
    CALL hex_to_str
    LDI r6, 40
    LDI r9, 152
    LDI r2, NUMBUF
    LDI r15, COL_GREEN
    LDI r5, 0
    DRAWTEXT r6, r9, r2, r15, r5

    ; Show opcode histogram top entry
    LDI r20, BUF
    STRO r20, "VM Status: Running"
    LDI r6, 80
    LDI r9, 152
    LDI r2, BUF
    LDI r15, COL_GREEN
    LDI r5, 0
    DRAWTEXT r6, r9, r2, r15, r5

    ; ---- Footer ----
    LDI r6, 0
    LDI r9, 236
    LDI r2, 256
    LDI r15, 20
    LDI r5, COL_TITLE
    RECTF r6, r9, r2, r15, r5

    LDI r20, BUF
    STRO r20, "Geometry OS v1.0  |  Q:Quit"
    LDI r6, 24
    LDI r9, 242
    LDI r2, BUF
    LDI r15, COL_GRAY
    LDI r5, COL_TITLE
    DRAWTEXT r6, r9, r2, r15, r5

    ; Handle input
    IKEY r11
    JZ r11, no_input
    LDI r16, 81          ; 'Q'
    CMP r11, r16
    JNZ r12, no_input
    HALT

no_input:
    FRAME
    JMP main_loop


; =========================================
; int_to_str subroutine
; Converts r1 (u32) to decimal string at r20
; Returns null-terminated string. r12 = start address.
; =========================================
int_to_str:
    PUSH r31
    PUSH r20
    LDI r16, 0

    JZ r1, its_zero

its_loop:
    MOV r18, r1
    LDI r17, 10
    MOD r18, r17
    LDI r19, 48
    ADD r18, r19
    PUSH r18
    LDI r17, 10
    DIV r1, r17
    LDI r19, 1
    ADD r16, r19
    JNZ r1, its_loop

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
    POP r12
    POP r31
    RET

its_zero:
    LDI r18, 48
    STORE r20, r18
    LDI r19, 1
    ADD r20, r19
    LDI r18, 0
    STORE r20, r18
    POP r12
    POP r31
    RET

; =========================================
; hex_to_str subroutine
; Converts r1 (u32) to hex string "0x" prefix at r20
; Returns null-terminated. r12 = start address.
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
    MOV r18, r1
    LDI r19, 28
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r1
    LDI r19, 24
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r1
    LDI r19, 20
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r1
    LDI r19, 16
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r1
    LDI r19, 12
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r1
    LDI r19, 8
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r1
    LDI r19, 4
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r1
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    LDI r18, 0
    STORE r20, r18
    POP r12
    POP r31
    RET

hex_nibble_s:
    PUSH r31
    LDI r19, 10
    CMP r18, r19
    BGE r12, hex_alpha_s
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
