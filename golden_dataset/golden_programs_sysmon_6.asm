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
LDI r15, 1

; =========================================
; Main loop
; =========================================
main_loop:
    LDI r15, COL_BG
    FILL r15

    ; Title bar
    LDI r15, 0
    LDI r7, 0
    LDI r1, 256
    LDI r3, 22
    LDI r2, COL_TITLE
    RECTF r15, r7, r1, r3, r2

    LDI r20, BUF
    STRO r20, "System Dashboard"
    LDI r15, 60
    LDI r7, 5
    LDI r1, BUF
    LDI r3, COL_FG
    LDI r2, COL_TITLE
    DRAWTEXT r15, r7, r1, r3, r2

    ; ---- GeOS Status Panel (left side) ----
    LDI r15, 4
    LDI r7, 28
    LDI r1, 124
    LDI r3, 100
    LDI r2, COL_PANEL
    RECTF r15, r7, r1, r3, r2

    ; Panel title
    LDI r20, BUF
    STRO r20, "GeOS Status"
    LDI r15, 8
    LDI r7, 30
    LDI r1, BUF
    LDI r3, COL_CYAN
    LDI r2, COL_PANEL
    DRAWTEXT r15, r7, r1, r3, r2

    ; Separator
    LDI r15, 8
    LDI r7, 42
    LDI r1, 116
    LDI r3, 1
    LDI r2, COL_GRAY
    RECTF r15, r7, r1, r3, r2

    ; Process count
    LDI r20, BUF
    STRO r20, "Processes"
    LDI r15, 8
    LDI r7, 48
    LDI r1, BUF
    LDI r3, COL_LABEL
    LDI r2, 0
    DRAWTEXT r15, r7, r1, r3, r2

    NPROC
    MOV r8, r0
    LDI r20, NUMBUF
    CALL int_to_str
    LDI r15, 90
    LDI r7, 48
    LDI r1, NUMBUF
    LDI r3, COL_GREEN
    LDI r2, 0
    DRAWTEXT r15, r7, r1, r3, r2

    ; Frame count (uptime)
    LDI r20, BUF
    STRO r20, "Frames"
    LDI r15, 8
    LDI r7, 62
    LDI r1, BUF
    LDI r3, COL_LABEL
    LDI r2, 0
    DRAWTEXT r15, r7, r1, r3, r2

    LDI r20, TICKS
    LOAD r8, r20
    LDI r20, NUMBUF
    CALL int_to_str
    LDI r15, 90
    LDI r7, 62
    LDI r1, NUMBUF
    LDI r3, COL_GREEN
    LDI r2, 0
    DRAWTEXT r15, r7, r1, r3, r2

    ; RAM Size
    LDI r20, BUF
    STRO r20, "RAM"
    LDI r15, 8
    LDI r7, 76
    LDI r1, BUF
    LDI r3, COL_LABEL
    LDI r2, 0
    DRAWTEXT r15, r7, r1, r3, r2

    LDI r20, BUF
    STRO r20, "64K x u32"
    LDI r15, 60
    LDI r7, 76
    LDI r1, BUF
    LDI r3, COL_FG
    LDI r2, 0
    DRAWTEXT r15, r7, r1, r3, r2

    ; Screen
    LDI r20, BUF
    STRO r20, "Screen"
    LDI r15, 8
    LDI r7, 90
    LDI r1, BUF
    LDI r3, COL_LABEL
    LDI r2, 0
    DRAWTEXT r15, r7, r1, r3, r2

    LDI r20, BUF
    STRO r20, "256x256"
    LDI r15, 60
    LDI r7, 90
    LDI r1, BUF
    LDI r3, COL_FG
    LDI r2, 0
    DRAWTEXT r15, r7, r1, r3, r2

    ; Opcodes
    LDI r20, BUF
    STRO r20, "Opcodes"
    LDI r15, 8
    LDI r7, 104
    LDI r1, BUF
    LDI r3, COL_LABEL
    LDI r2, 0
    DRAWTEXT r15, r7, r1, r3, r2

    LDI r20, BUF
    STRO r20, "150+"
    LDI r15, 60
    LDI r7, 104
    LDI r1, BUF
    LDI r3, COL_AMBER
    LDI r2, 0
    DRAWTEXT r15, r7, r1, r3, r2

    ; ---- Host Memory Panel (right side) ----
    LDI r15, 132
    LDI r7, 28
    LDI r1, 120
    LDI r3, 100
    LDI r2, COL_PANEL
    RECTF r15, r7, r1, r3, r2

    LDI r20, BUF
    STRO r20, "Host Memory"
    LDI r15, 136
    LDI r7, 30
    LDI r1, BUF
    LDI r3, COL_CYAN
    LDI r2, COL_PANEL
    DRAWTEXT r15, r7, r1, r3, r2

    ; Separator
    LDI r15, 136
    LDI r7, 42
    LDI r1, 112
    LDI r3, 1
    LDI r2, COL_GRAY
    RECTF r15, r7, r1, r3, r2

    ; Try to read /proc/meminfo
    ; First write the path "/proc/meminfo" into RAM
    LDI r20, BUF
    STRO r20, "/proc/meminfo"

    ; FSOPEN path_reg, mode_reg (0=read)
    LDI r15, BUF
    LDI r7, 0           ; mode = read
    FSOPEN r15, r7
    ; r0 = handle or 0xFFFFFFFF on error
    LDI r14, 0xFFFFFFFF
    CMP r0, r14
    JZ r0, meminfo_error

    ; Store handle
    LDI r20, HANDLE
    STORE r20, r0

    ; FSREAD handle_reg, buf_reg, len_reg
    LDI r20, HANDLE
    LOAD r15, r20         ; handle
    LDI r7, PROCBUF      ; dest buffer
    LDI r1, BUFSIZE      ; max bytes
    FSREAD r15, r7, r1
    ; r0 = bytes read

    LDI r14, 0xFFFFFFFF
    CMP r0, r14
    JZ r0, meminfo_close

    ; Store bytes read
    LDI r20, BYTESRD
    STORE r20, r0

    ; Close file
    LDI r20, HANDLE
    LOAD r15, r20
    FSCLOSE r15

    ; Parse MemTotal from the buffer
    ; We'll scan for "MemTotal:" and extract the number
    LDI r10, PROCBUF     ; buffer start
    LDI r5, 0           ; position
    LDI r11, 0           ; found flag

    ; Scan for "MemTotal:"
scan_memtotal:
    ; Check if we've read enough
    LDI r20, BYTESRD
    LOAD r14, r20
    LDI r16, 9           ; "MemTotal:" is 9 chars
    ADD r16, r5
    CMP r16, r14
    BGE r0, scan_done_mt

    ; Check if current position starts with "MemTotal:"
    MOV r20, r10
    ADD r20, r5
    LOAD r8, r20        ; char at position
    LDI r14, 77          ; 'M'
    CMP r8, r14
    JNZ r0, scan_next_mt

    ; Check next char 'e'
    LDI r14, 1
    ADD r20, r14
    LOAD r8, r20
    LDI r14, 101         ; 'e'
    CMP r8, r14
    JNZ r0, scan_next_mt

    ; Check 'm'
    LDI r14, 2
    MOV r16, r10
    ADD r16, r5
    ADD r16, r14
    LOAD r8, r16
    LDI r14, 109         ; 'm'
    CMP r8, r14
    JNZ r0, scan_next_mt

    ; Found "Mem" - assume MemTotal. Skip to number after ":"
    MOV r20, r10
    ADD r20, r5
    LDI r14, 9           ; skip "MemTotal:"
    ADD r20, r14
    ; Skip spaces
skip_spaces_mt:
    LOAD r8, r20
    LDI r14, 32          ; space
    CMP r8, r14
    JNZ r0, parse_num_mt
    LDI r14, 1
    ADD r20, r14
    JMP skip_spaces_mt

parse_num_mt:
    ; Parse decimal number at r20 into r8
    LDI r8, 0           ; accumulated number
parse_digit_mt:
    PUSH r20
    LOAD r14, r20        ; char
    LDI r16, 48          ; '0'
    CMP r14, r16
    BLT r0, parse_done_mt
    LDI r16, 57          ; '9'
    CMP r14, r16
    BGE r0, parse_next_chk_mt
    JMP parse_done_mt
parse_next_chk_mt:
    ; digit = char - '0'
    LDI r16, 48
    SUB r14, r16
    ; result = result * 10 + digit
    LDI r16, 10
    MUL r8, r16
    ADD r8, r14
    POP r20
    LDI r14, 1
    ADD r20, r14
    JMP parse_digit_mt

parse_done_mt:
    POP r20
    LDI r11, 1           ; found flag
    JMP scan_done_mt

scan_next_mt:
    LDI r14, 1
    ADD r5, r14
    JMP scan_memtotal

scan_done_mt:
    ; Display MemTotal if found
    CMP r11, r0          ; r0 is 0 from CMP
    LDI r14, 0
    CMP r11, r14
    JZ r0, show_meminfo_err

    ; r8 has MemTotal in kB. Display as MB: divide by 1024
    LDI r14, 1024
    DIV r8, r14

    LDI r20, BUF
    STRO r20, "Total RAM"
    LDI r15, 136
    LDI r7, 48
    LDI r1, BUF
    LDI r3, COL_LABEL
    LDI r2, 0
    DRAWTEXT r15, r7, r1, r3, r2

    LDI r20, NUMBUF
    CALL int_to_str
    LDI r15, 200
    LDI r7, 48
    LDI r1, NUMBUF
    LDI r3, COL_GREEN
    LDI r2, 0
    DRAWTEXT r15, r7, r1, r3, r2

    LDI r20, BUF
    STRO r20, "MB"
    LDI r15, 232
    LDI r7, 48
    LDI r1, BUF
    LDI r3, COL_GREEN
    LDI r2, 0
    DRAWTEXT r15, r7, r1, r3, r2

    ; Memory bar (visual indicator)
    LDI r15, 136
    LDI r7, 62
    LDI r1, 112
    LDI r3, 10
    LDI r2, COL_BAR_BG
    RECTF r15, r7, r1, r3, r2

    ; Fill bar proportional (assume r8 is MB, max ~16GB=16384MB)
    ; bar_width = r8 * 112 / 16384
    LDI r14, 112
    MUL r8, r14
    LDI r14, 16384
    DIV r8, r14
    ; Cap at 112
    LDI r14, 112
    CMP r8, r14
    BLT r0, draw_bar
    MOV r8, r14

draw_bar:
    LDI r15, 136
    LDI r7, 62
    MOV r1, r8
    LDI r3, 10
    LDI r2, COL_BAR_FG
    RECTF r15, r7, r1, r3, r2

    JMP host_panel_done

show_meminfo_err:
meminfo_error:
    LDI r20, BUF
    STRO r20, "Cannot read"
    LDI r15, 136
    LDI r7, 48
    LDI r1, BUF
    LDI r3, COL_YELLOW
    LDI r2, 0
    DRAWTEXT r15, r7, r1, r3, r2

    LDI r20, BUF
    STRO r20, "/proc/meminfo"
    LDI r15, 136
    LDI r7, 62
    LDI r1, BUF
    LDI r3, COL_YELLOW
    LDI r2, 0
    DRAWTEXT r15, r7, r1, r3, r2

meminfo_close:
    ; Try to close if we have a handle
    LDI r20, HANDLE
    LOAD r14, r20
    LDI r16, 0xFFFFFFFF
    CMP r14, r16
    JZ r0, host_panel_done
    MOV r15, r14
    FSCLOSE r15

host_panel_done:
    ; ---- Bottom panel: VM internals ----
    LDI r15, 4
    LDI r7, 134
    LDI r1, 248
    LDI r3, 50
    LDI r2, COL_DARK
    RECTF r15, r7, r1, r3, r2

    LDI r20, BUF
    STRO r20, "VM Registers"
    LDI r15, 8
    LDI r7, 136
    LDI r1, BUF
    LDI r3, COL_CYAN
    LDI r2, COL_DARK
    DRAWTEXT r15, r7, r1, r3, r2

    ; Show current PC
    LDI r20, BUF
    STRO r20, "PC"
    LDI r15, 8
    LDI r7, 152
    LDI r1, BUF
    LDI r3, COL_LABEL
    LDI r2, 0
    DRAWTEXT r15, r7, r1, r3, r2

    ; Display via PROCINFO (main process, field=1=PC)
    LDI r15, 0            ; PID 0
    LDI r7, 1            ; field = PC
    PROCINFO r15, r7
    MOV r8, r0
    LDI r20, NUMBUF
    CALL hex_to_str
    LDI r15, 40
    LDI r7, 152
    LDI r1, NUMBUF
    LDI r3, COL_GREEN
    LDI r2, 0
    DRAWTEXT r15, r7, r1, r3, r2

    ; Show opcode histogram top entry
    LDI r20, BUF
    STRO r20, "VM Status: Running"
    LDI r15, 80
    LDI r7, 152
    LDI r1, BUF
    LDI r3, COL_GREEN
    LDI r2, 0
    DRAWTEXT r15, r7, r1, r3, r2

    ; ---- Footer ----
    LDI r15, 0
    LDI r7, 236
    LDI r1, 256
    LDI r3, 20
    LDI r2, COL_TITLE
    RECTF r15, r7, r1, r3, r2

    LDI r20, BUF
    STRO r20, "Geometry OS v1.0  |  Q:Quit"
    LDI r15, 24
    LDI r7, 242
    LDI r1, BUF
    LDI r3, COL_GRAY
    LDI r2, COL_TITLE
    DRAWTEXT r15, r7, r1, r3, r2

    ; Handle input
    IKEY r14
    JZ r14, no_input
    LDI r16, 81          ; 'Q'
    CMP r14, r16
    JNZ r0, no_input
    HALT

no_input:
    FRAME
    JMP main_loop


; =========================================
; int_to_str subroutine
; Converts r8 (u32) to decimal string at r20
; Returns null-terminated string. r0 = start address.
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
    POP r0
    POP r31
    RET

its_zero:
    LDI r18, 48
    STORE r20, r18
    LDI r19, 1
    ADD r20, r19
    LDI r18, 0
    STORE r20, r18
    POP r0
    POP r31
    RET

; =========================================
; hex_to_str subroutine
; Converts r8 (u32) to hex string "0x" prefix at r20
; Returns null-terminated. r0 = start address.
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
    POP r0
    POP r31
    RET

hex_nibble_s:
    PUSH r31
    LDI r19, 10
    CMP r18, r19
    BGE r0, hex_alpha_s
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
