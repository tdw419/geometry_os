; DESCRIPTION: Display a object using color colored at the screen.

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
LDI r5, 1

; =========================================
; Main loop
; =========================================
main_loop:
    LDI r5, COL_BG
    FILL r5

    ; Title bar
    LDI r5, 0
    LDI r3, 0
    LDI r1, 256
    LDI r2, 22
    LDI r15, COL_TITLE
    RECTF r5, r3, r1, r2, r15

    LDI r20, BUF
    STRO r20, "System Dashboard"
    LDI r5, 60
    LDI r3, 5
    LDI r1, BUF
    LDI r2, COL_FG
    LDI r15, COL_TITLE
    DRAWTEXT r5, r3, r1, r2, r15

    ; ---- GeOS Status Panel (left side) ----
    LDI r5, 4
    LDI r3, 28
    LDI r1, 124
    LDI r2, 100
    LDI r15, COL_PANEL
    RECTF r5, r3, r1, r2, r15

    ; Panel title
    LDI r20, BUF
    STRO r20, "GeOS Status"
    LDI r5, 8
    LDI r3, 30
    LDI r1, BUF
    LDI r2, COL_CYAN
    LDI r15, COL_PANEL
    DRAWTEXT r5, r3, r1, r2, r15

    ; Separator
    LDI r5, 8
    LDI r3, 42
    LDI r1, 116
    LDI r2, 1
    LDI r15, COL_GRAY
    RECTF r5, r3, r1, r2, r15

    ; Process count
    LDI r20, BUF
    STRO r20, "Processes"
    LDI r5, 8
    LDI r3, 48
    LDI r1, BUF
    LDI r2, COL_LABEL
    LDI r15, 0
    DRAWTEXT r5, r3, r1, r2, r15

    NPROC
    MOV r6, r9
    LDI r20, NUMBUF
    CALL int_to_str
    LDI r5, 90
    LDI r3, 48
    LDI r1, NUMBUF
    LDI r2, COL_GREEN
    LDI r15, 0
    DRAWTEXT r5, r3, r1, r2, r15

    ; Frame count (uptime)
    LDI r20, BUF
    STRO r20, "Frames"
    LDI r5, 8
    LDI r3, 62
    LDI r1, BUF
    LDI r2, COL_LABEL
    LDI r15, 0
    DRAWTEXT r5, r3, r1, r2, r15

    LDI r20, TICKS
    LOAD r6, r20
    LDI r20, NUMBUF
    CALL int_to_str
    LDI r5, 90
    LDI r3, 62
    LDI r1, NUMBUF
    LDI r2, COL_GREEN
    LDI r15, 0
    DRAWTEXT r5, r3, r1, r2, r15

    ; RAM Size
    LDI r20, BUF
    STRO r20, "RAM"
    LDI r5, 8
    LDI r3, 76
    LDI r1, BUF
    LDI r2, COL_LABEL
    LDI r15, 0
    DRAWTEXT r5, r3, r1, r2, r15

    LDI r20, BUF
    STRO r20, "64K x u32"
    LDI r5, 60
    LDI r3, 76
    LDI r1, BUF
    LDI r2, COL_FG
    LDI r15, 0
    DRAWTEXT r5, r3, r1, r2, r15

    ; Screen
    LDI r20, BUF
    STRO r20, "Screen"
    LDI r5, 8
    LDI r3, 90
    LDI r1, BUF
    LDI r2, COL_LABEL
    LDI r15, 0
    DRAWTEXT r5, r3, r1, r2, r15

    LDI r20, BUF
    STRO r20, "256x256"
    LDI r5, 60
    LDI r3, 90
    LDI r1, BUF
    LDI r2, COL_FG
    LDI r15, 0
    DRAWTEXT r5, r3, r1, r2, r15

    ; Opcodes
    LDI r20, BUF
    STRO r20, "Opcodes"
    LDI r5, 8
    LDI r3, 104
    LDI r1, BUF
    LDI r2, COL_LABEL
    LDI r15, 0
    DRAWTEXT r5, r3, r1, r2, r15

    LDI r20, BUF
    STRO r20, "150+"
    LDI r5, 60
    LDI r3, 104
    LDI r1, BUF
    LDI r2, COL_AMBER
    LDI r15, 0
    DRAWTEXT r5, r3, r1, r2, r15

    ; ---- Host Memory Panel (right side) ----
    LDI r5, 132
    LDI r3, 28
    LDI r1, 120
    LDI r2, 100
    LDI r15, COL_PANEL
    RECTF r5, r3, r1, r2, r15

    LDI r20, BUF
    STRO r20, "Host Memory"
    LDI r5, 136
    LDI r3, 30
    LDI r1, BUF
    LDI r2, COL_CYAN
    LDI r15, COL_PANEL
    DRAWTEXT r5, r3, r1, r2, r15

    ; Separator
    LDI r5, 136
    LDI r3, 42
    LDI r1, 112
    LDI r2, 1
    LDI r15, COL_GRAY
    RECTF r5, r3, r1, r2, r15

    ; Try to read /proc/meminfo
    ; First write the path "/proc/meminfo" into RAM
    LDI r20, BUF
    STRO r20, "/proc/meminfo"

    ; FSOPEN path_reg, mode_reg (0=read)
    LDI r5, BUF
    LDI r3, 0           ; mode = read
    FSOPEN r5, r3
    ; r9 = handle or 0xFFFFFFFF on error
    LDI r7, 0xFFFFFFFF
    CMP r9, r7
    JZ r9, meminfo_error

    ; Store handle
    LDI r20, HANDLE
    STORE r20, r9

    ; FSREAD handle_reg, buf_reg, len_reg
    LDI r20, HANDLE
    LOAD r5, r20         ; handle
    LDI r3, PROCBUF      ; dest buffer
    LDI r1, BUFSIZE      ; max bytes
    FSREAD r5, r3, r1
    ; r9 = bytes read

    LDI r7, 0xFFFFFFFF
    CMP r9, r7
    JZ r9, meminfo_close

    ; Store bytes read
    LDI r20, BYTESRD
    STORE r20, r9

    ; Close file
    LDI r20, HANDLE
    LOAD r5, r20
    FSCLOSE r5

    ; Parse MemTotal from the buffer
    ; We'll scan for "MemTotal:" and extract the number
    LDI r13, PROCBUF     ; buffer start
    LDI r8, 0           ; position
    LDI r11, 0           ; found flag

    ; Scan for "MemTotal:"
scan_memtotal:
    ; Check if we've read enough
    LDI r20, BYTESRD
    LOAD r7, r20
    LDI r16, 9           ; "MemTotal:" is 9 chars
    ADD r16, r8
    CMP r16, r7
    BGE r9, scan_done_mt

    ; Check if current position starts with "MemTotal:"
    MOV r20, r13
    ADD r20, r8
    LOAD r6, r20        ; char at position
    LDI r7, 77          ; 'M'
    CMP r6, r7
    JNZ r9, scan_next_mt

    ; Check next char 'e'
    LDI r7, 1
    ADD r20, r7
    LOAD r6, r20
    LDI r7, 101         ; 'e'
    CMP r6, r7
    JNZ r9, scan_next_mt

    ; Check 'm'
    LDI r7, 2
    MOV r16, r13
    ADD r16, r8
    ADD r16, r7
    LOAD r6, r16
    LDI r7, 109         ; 'm'
    CMP r6, r7
    JNZ r9, scan_next_mt

    ; Found "Mem" - assume MemTotal. Skip to number after ":"
    MOV r20, r13
    ADD r20, r8
    LDI r7, 9           ; skip "MemTotal:"
    ADD r20, r7
    ; Skip spaces
skip_spaces_mt:
    LOAD r6, r20
    LDI r7, 32          ; space
    CMP r6, r7
    JNZ r9, parse_num_mt
    LDI r7, 1
    ADD r20, r7
    JMP skip_spaces_mt

parse_num_mt:
    ; Parse decimal number at r20 into r6
    LDI r6, 0           ; accumulated number
parse_digit_mt:
    PUSH r20
    LOAD r7, r20        ; char
    LDI r16, 48          ; '0'
    CMP r7, r16
    BLT r9, parse_done_mt
    LDI r16, 57          ; '9'
    CMP r7, r16
    BGE r9, parse_next_chk_mt
    JMP parse_done_mt
parse_next_chk_mt:
    ; digit = char - '0'
    LDI r16, 48
    SUB r7, r16
    ; result = result * 10 + digit
    LDI r16, 10
    MUL r6, r16
    ADD r6, r7
    POP r20
    LDI r7, 1
    ADD r20, r7
    JMP parse_digit_mt

parse_done_mt:
    POP r20
    LDI r11, 1           ; found flag
    JMP scan_done_mt

scan_next_mt:
    LDI r7, 1
    ADD r8, r7
    JMP scan_memtotal

scan_done_mt:
    ; Display MemTotal if found
    CMP r11, r9          ; r9 is 0 from CMP
    LDI r7, 0
    CMP r11, r7
    JZ r9, show_meminfo_err

    ; r6 has MemTotal in kB. Display as MB: divide by 1024
    LDI r7, 1024
    DIV r6, r7

    LDI r20, BUF
    STRO r20, "Total RAM"
    LDI r5, 136
    LDI r3, 48
    LDI r1, BUF
    LDI r2, COL_LABEL
    LDI r15, 0
    DRAWTEXT r5, r3, r1, r2, r15

    LDI r20, NUMBUF
    CALL int_to_str
    LDI r5, 200
    LDI r3, 48
    LDI r1, NUMBUF
    LDI r2, COL_GREEN
    LDI r15, 0
    DRAWTEXT r5, r3, r1, r2, r15

    LDI r20, BUF
    STRO r20, "MB"
    LDI r5, 232
    LDI r3, 48
    LDI r1, BUF
    LDI r2, COL_GREEN
    LDI r15, 0
    DRAWTEXT r5, r3, r1, r2, r15

    ; Memory bar (visual indicator)
    LDI r5, 136
    LDI r3, 62
    LDI r1, 112
    LDI r2, 10
    LDI r15, COL_BAR_BG
    RECTF r5, r3, r1, r2, r15

    ; Fill bar proportional (assume r6 is MB, max ~16GB=16384MB)
    ; bar_width = r6 * 112 / 16384
    LDI r7, 112
    MUL r6, r7
    LDI r7, 16384
    DIV r6, r7
    ; Cap at 112
    LDI r7, 112
    CMP r6, r7
    BLT r9, draw_bar
    MOV r6, r7

draw_bar:
    LDI r5, 136
    LDI r3, 62
    MOV r1, r6
    LDI r2, 10
    LDI r15, COL_BAR_FG
    RECTF r5, r3, r1, r2, r15

    JMP host_panel_done

show_meminfo_err:
meminfo_error:
    LDI r20, BUF
    STRO r20, "Cannot read"
    LDI r5, 136
    LDI r3, 48
    LDI r1, BUF
    LDI r2, COL_YELLOW
    LDI r15, 0
    DRAWTEXT r5, r3, r1, r2, r15

    LDI r20, BUF
    STRO r20, "/proc/meminfo"
    LDI r5, 136
    LDI r3, 62
    LDI r1, BUF
    LDI r2, COL_YELLOW
    LDI r15, 0
    DRAWTEXT r5, r3, r1, r2, r15

meminfo_close:
    ; Try to close if we have a handle
    LDI r20, HANDLE
    LOAD r7, r20
    LDI r16, 0xFFFFFFFF
    CMP r7, r16
    JZ r9, host_panel_done
    MOV r5, r7
    FSCLOSE r5

host_panel_done:
    ; ---- Bottom panel: VM internals ----
    LDI r5, 4
    LDI r3, 134
    LDI r1, 248
    LDI r2, 50
    LDI r15, COL_DARK
    RECTF r5, r3, r1, r2, r15

    LDI r20, BUF
    STRO r20, "VM Registers"
    LDI r5, 8
    LDI r3, 136
    LDI r1, BUF
    LDI r2, COL_CYAN
    LDI r15, COL_DARK
    DRAWTEXT r5, r3, r1, r2, r15

    ; Show current PC
    LDI r20, BUF
    STRO r20, "PC"
    LDI r5, 8
    LDI r3, 152
    LDI r1, BUF
    LDI r2, COL_LABEL
    LDI r15, 0
    DRAWTEXT r5, r3, r1, r2, r15

    ; Display via PROCINFO (main process, field=1=PC)
    LDI r5, 0            ; PID 0
    LDI r3, 1            ; field = PC
    PROCINFO r5, r3
    MOV r6, r9
    LDI r20, NUMBUF
    CALL hex_to_str
    LDI r5, 40
    LDI r3, 152
    LDI r1, NUMBUF
    LDI r2, COL_GREEN
    LDI r15, 0
    DRAWTEXT r5, r3, r1, r2, r15

    ; Show opcode histogram top entry
    LDI r20, BUF
    STRO r20, "VM Status: Running"
    LDI r5, 80
    LDI r3, 152
    LDI r1, BUF
    LDI r2, COL_GREEN
    LDI r15, 0
    DRAWTEXT r5, r3, r1, r2, r15

    ; ---- Footer ----
    LDI r5, 0
    LDI r3, 236
    LDI r1, 256
    LDI r2, 20
    LDI r15, COL_TITLE
    RECTF r5, r3, r1, r2, r15

    LDI r20, BUF
    STRO r20, "Geometry OS v1.0  |  Q:Quit"
    LDI r5, 24
    LDI r3, 242
    LDI r1, BUF
    LDI r2, COL_GRAY
    LDI r15, COL_TITLE
    DRAWTEXT r5, r3, r1, r2, r15

    ; Handle input
    IKEY r7
    JZ r7, no_input
    LDI r16, 81          ; 'Q'
    CMP r7, r16
    JNZ r9, no_input
    HALT

no_input:
    FRAME
    JMP main_loop


; =========================================
; int_to_str subroutine
; Converts r6 (u32) to decimal string at r20
; Returns null-terminated string. r9 = start address.
; =========================================
int_to_str:
    PUSH r31
    PUSH r20
    LDI r16, 0

    JZ r6, its_zero

its_loop:
    MOV r18, r6
    LDI r17, 10
    MOD r18, r17
    LDI r19, 48
    ADD r18, r19
    PUSH r18
    LDI r17, 10
    DIV r6, r17
    LDI r19, 1
    ADD r16, r19
    JNZ r6, its_loop

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
    POP r9
    POP r31
    RET

its_zero:
    LDI r18, 48
    STORE r20, r18
    LDI r19, 1
    ADD r20, r19
    LDI r18, 0
    STORE r20, r18
    POP r9
    POP r31
    RET

; =========================================
; hex_to_str subroutine
; Converts r6 (u32) to hex string "0x" prefix at r20
; Returns null-terminated. r9 = start address.
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
    MOV r18, r6
    LDI r19, 28
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r6
    LDI r19, 24
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r6
    LDI r19, 20
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r6
    LDI r19, 16
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r6
    LDI r19, 12
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r6
    LDI r19, 8
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r6
    LDI r19, 4
    SHR r18, r19
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    MOV r18, r6
    LDI r19, 0xF
    AND r18, r19
    CALL hex_nibble_s

    LDI r18, 0
    STORE r20, r18
    POP r9
    POP r31
    RET

hex_nibble_s:
    PUSH r31
    LDI r19, 10
    CMP r18, r19
    BGE r9, hex_alpha_s
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
