; DESCRIPTION: Draw rectangle: pos=the screen, color=colored, size=fixed size.

; help.asm -- Help Viewer for Geometry OS
;
; Shows keyboard shortcuts, opcode reference, and shell commands.
; Reads help text from RAM (pre-loaded). Scrollable with arrow keys.
;
; Proves: TEXT, DRAWTEXT, RECTF, STRO, IKEY, FRAME, 
;         scrolling, keyboard navigation.
;
; RAM Layout:
;   0x6000-0x60FF  Text buffers
;   0x6100         Scroll offset
;   0x6101         Max scroll
;
; No colons in comments (assembler pitfall)

#define TICKS   0xFFE
#define BUF     0x6000
#define SCROLL  0x6100
#define MAXSCRL 0x6101

; Init
LDI r30, 0xFD00
LDI r12, 1

LDI r20, SCROLL
LDI r21, 0
STORE r20, r21
LDI r20, MAXSCRL
LDI r21, 12
STORE r20, r21

; =========================================
; Main Loop
; =========================================
main_loop:
    IKEY r13
    JZ r13, no_input

    ; Up arrow (A=65) = scroll up
    LDI r2, 65
    CMP r13, r2
    JZ r10, scroll_up

    ; Down arrow (B=66) = scroll down
    LDI r2, 66
    CMP r13, r2
    JZ r10, scroll_down

    ; ESC (27) = quit
    LDI r2, 27
    CMP r13, r2
    JZ r10, help_quit

    JMP no_input

scroll_up:
    LDI r20, SCROLL
    LOAD r14, r20
    JZ r14, no_input
    LDI r2, 1
    SUB r14, r2
    STORE r20, r14
    JMP no_input

scroll_down:
    LDI r20, SCROLL
    LOAD r14, r20
    LDI r20, MAXSCRL
    LOAD r16, r20
    CMP r14, r16
    BGE r10, no_input
    LDI r20, SCROLL
    LOAD r14, r20
    LDI r2, 1
    ADD r14, r2
    STORE r20, r14
    JMP no_input

no_input:
    CALL render_help
    FRAME
    JMP main_loop

help_quit:
    HALT

; =========================================
; render_help -- draw help screen
; =========================================
render_help:
    PUSH r31

    ; Background
    LDI r12, 0x0D1B2A
    FILL r12

    ; Title bar
    LDI r12, 0
    LDI r5, 0
    LDI r3, 256
    LDI r1, 24
    LDI r9, 0x1B3A5C
    RECTF r12, r5, r3, r1, r9

    LDI r20, BUF
    STRO r20, "Geometry OS Help"
    LDI r12, 56
    LDI r5, 6
    LDI r3, BUF
    LDI r1, 0xFFFFFF
    LDI r9, 0x1B3A5C
    DRAWTEXT r12, r5, r3, r1, r9

    ; Content area background
    LDI r12, 8
    LDI r5, 28
    LDI r3, 240
    LDI r1, 216
    LDI r9, 0x101828
    RECTF r12, r5, r3, r1, r9

    ; Load scroll offset
    LDI r20, SCROLL
    LOAD r15, r20

    ; Draw help lines based on scroll offset
    ; Each line is 16px apart, starting at y=34
    ; We draw up to 13 visible lines

    ; Line 0 (relative to scroll)
    LDI r11, 0            ; line index
    LDI r8, 34           ; y position

help_line_loop:
    ; Check if we've drawn enough lines (13 visible)
    LDI r14, 13
    CMP r11, r14
    BGE r10, help_lines_done

    ; Compute which help entry to show: scroll_offset + line_index
    MOV r14, r15
    ADD r14, r11

    ; Dispatch on help entry index
    JZ r14, hl_keyboard
    LDI r2, 1
    CMP r14, r2
    JZ r10, hl_keys2
    LDI r2, 2
    CMP r14, r2
    JZ r10, hl_opcodes1
    LDI r2, 3
    CMP r14, r2
    JZ r10, hl_opcodes2
    LDI r2, 4
    CMP r14, r2
    JZ r10, hl_opcodes3
    LDI r2, 5
    CMP r14, r2
    JZ r10, hl_shell
    LDI r2, 6
    CMP r14, r2
    JZ r10, hl_memory
    LDI r2, 7
    CMP r14, r2
    JZ r10, hl_tips1
    LDI r2, 8
    CMP r14, r2
    JZ r10, hl_tips2
    LDI r2, 9
    CMP r14, r2
    JZ r10, hl_tips3
    LDI r2, 10
    CMP r14, r2
    JZ r10, hl_tips4
    LDI r2, 11
    CMP r14, r2
    JZ r10, hl_tips5
    LDI r2, 12
    CMP r14, r2
    JZ r10, hl_tips6
    JMP hl_blank

hl_keyboard:
    LDI r20, BUF
    STRO r20, "Keyboard Shortcuts"
    LDI r1, 0x8888FF
    JMP hl_draw

hl_keys2:
    LDI r20, BUF
    STRO r20, "F5=Run F8=Asm F6=Step ESC=Back"
    LDI r1, 0xAAAACC
    JMP hl_draw

hl_opcodes1:
    LDI r20, BUF
    STRO r20, "Opcodes (113 total)"
    LDI r1, 0x8888FF
    JMP hl_draw

hl_opcodes2:
    LDI r20, BUF
    STRO r20, "LDI LOAD STORE MOV ADD SUB MUL"
    LDI r1, 0xAAAACC
    JMP hl_draw

hl_opcodes3:
    LDI r20, BUF
    STRO r20, "DIV AND OR XOR SHL SHR MOD NEG"
    LDI r1, 0xAAAACC
    JMP hl_draw

hl_shell:
    LDI r20, BUF
    STRO r20, "Shell: help ls load run edit regs"
    LDI r1, 0xAAAACC
    JMP hl_draw

hl_memory:
    LDI r20, BUF
    STRO r20, "64K RAM  0x000-0x3FF=Source"
    LDI r1, 0xAAAACC
    JMP hl_draw

hl_tips1:
    LDI r20, BUF
    STRO r20, "Tips"
    LDI r1, 0x8888FF
    JMP hl_draw

hl_tips2:
    LDI r20, BUF
    STRO r20, "r10 reserved for CMP results"
    LDI r1, 0xAAAACC
    JMP hl_draw

hl_tips3:
    LDI r20, BUF
    STRO r20, "r30=SP r31=LR (CALL/RET)"
    LDI r1, 0xAAAACC
    JMP hl_draw

hl_tips4:
    LDI r20, BUF
    STRO r20, "No colons in .asm comments"
    LDI r1, 0xFF8888
    JMP hl_draw

hl_tips5:
    LDI r20, BUF
    STRO r20, "FRAME for animation loops"
    LDI r1, 0xAAAACC
    JMP hl_draw

hl_tips6:
    LDI r20, BUF
    STRO r20, "IKEY reads keyboard each frame"
    LDI r1, 0xAAAACC
    JMP hl_draw

hl_blank:
    LDI r20, BUF
    STRO r20, ""
    LDI r1, 0xAAAACC

hl_draw:
    LDI r12, 16
    MOV r5, r8
    LDI r3, BUF
    LDI r9, 0x101828
    DRAWTEXT r12, r5, r3, r1, r9

    ; Next line
    LDI r14, 1
    ADD r11, r14
    LDI r14, 16
    ADD r8, r14
    JMP help_line_loop

help_lines_done:
    ; Footer
    LDI r12, 0
    LDI r5, 244
    LDI r3, 256
    LDI r1, 12
    LDI r9, 0x0A0A1A
    RECTF r12, r5, r3, r1, r9

    LDI r20, BUF
    STRO r20, "Up/Down: Scroll  ESC: Back"
    LDI r12, 52
    LDI r5, 246
    LDI r3, BUF
    LDI r1, 0x6666AA
    LDI r9, 0x0A0A1A
    DRAWTEXT r12, r5, r3, r1, r9

    POP r31
    RET
