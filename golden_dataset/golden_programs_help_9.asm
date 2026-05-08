; DESCRIPTION: Geometry OS program to draw a colored rectangle.

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
LDI r8, 1

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
    IKEY r3
    JZ r3, no_input

    ; Up arrow (A=65) = scroll up
    LDI r15, 65
    CMP r3, r15
    JZ r13, scroll_up

    ; Down arrow (B=66) = scroll down
    LDI r15, 66
    CMP r3, r15
    JZ r13, scroll_down

    ; ESC (27) = quit
    LDI r15, 27
    CMP r3, r15
    JZ r13, help_quit

    JMP no_input

scroll_up:
    LDI r20, SCROLL
    LOAD r1, r20
    JZ r1, no_input
    LDI r15, 1
    SUB r1, r15
    STORE r20, r1
    JMP no_input

scroll_down:
    LDI r20, SCROLL
    LOAD r1, r20
    LDI r20, MAXSCRL
    LOAD r16, r20
    CMP r1, r16
    BGE r13, no_input
    LDI r20, SCROLL
    LOAD r1, r20
    LDI r15, 1
    ADD r1, r15
    STORE r20, r1
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
    LDI r8, 0x0D1B2A
    FILL r8

    ; Title bar
    LDI r8, 0
    LDI r4, 0
    LDI r7, 256
    LDI r6, 24
    LDI r2, 0x1B3A5C
    RECTF r8, r4, r7, r6, r2

    LDI r20, BUF
    STRO r20, "Geometry OS Help"
    LDI r8, 56
    LDI r4, 6
    LDI r7, BUF
    LDI r6, 0xFFFFFF
    LDI r2, 0x1B3A5C
    DRAWTEXT r8, r4, r7, r6, r2

    ; Content area background
    LDI r8, 8
    LDI r4, 28
    LDI r7, 240
    LDI r6, 216
    LDI r2, 0x101828
    RECTF r8, r4, r7, r6, r2

    ; Load scroll offset
    LDI r20, SCROLL
    LOAD r5, r20

    ; Draw help lines based on scroll offset
    ; Each line is 16px apart, starting at y=34
    ; We draw up to 13 visible lines

    ; Line 0 (relative to scroll)
    LDI r0, 0            ; line index
    LDI r9, 34           ; y position

help_line_loop:
    ; Check if we've drawn enough lines (13 visible)
    LDI r1, 13
    CMP r0, r1
    BGE r13, help_lines_done

    ; Compute which help entry to show: scroll_offset + line_index
    MOV r1, r5
    ADD r1, r0

    ; Dispatch on help entry index
    JZ r1, hl_keyboard
    LDI r15, 1
    CMP r1, r15
    JZ r13, hl_keys2
    LDI r15, 2
    CMP r1, r15
    JZ r13, hl_opcodes1
    LDI r15, 3
    CMP r1, r15
    JZ r13, hl_opcodes2
    LDI r15, 4
    CMP r1, r15
    JZ r13, hl_opcodes3
    LDI r15, 5
    CMP r1, r15
    JZ r13, hl_shell
    LDI r15, 6
    CMP r1, r15
    JZ r13, hl_memory
    LDI r15, 7
    CMP r1, r15
    JZ r13, hl_tips1
    LDI r15, 8
    CMP r1, r15
    JZ r13, hl_tips2
    LDI r15, 9
    CMP r1, r15
    JZ r13, hl_tips3
    LDI r15, 10
    CMP r1, r15
    JZ r13, hl_tips4
    LDI r15, 11
    CMP r1, r15
    JZ r13, hl_tips5
    LDI r15, 12
    CMP r1, r15
    JZ r13, hl_tips6
    JMP hl_blank

hl_keyboard:
    LDI r20, BUF
    STRO r20, "Keyboard Shortcuts"
    LDI r6, 0x8888FF
    JMP hl_draw

hl_keys2:
    LDI r20, BUF
    STRO r20, "F5=Run F8=Asm F6=Step ESC=Back"
    LDI r6, 0xAAAACC
    JMP hl_draw

hl_opcodes1:
    LDI r20, BUF
    STRO r20, "Opcodes (113 total)"
    LDI r6, 0x8888FF
    JMP hl_draw

hl_opcodes2:
    LDI r20, BUF
    STRO r20, "LDI LOAD STORE MOV ADD SUB MUL"
    LDI r6, 0xAAAACC
    JMP hl_draw

hl_opcodes3:
    LDI r20, BUF
    STRO r20, "DIV AND OR XOR SHL SHR MOD NEG"
    LDI r6, 0xAAAACC
    JMP hl_draw

hl_shell:
    LDI r20, BUF
    STRO r20, "Shell: help ls load run edit regs"
    LDI r6, 0xAAAACC
    JMP hl_draw

hl_memory:
    LDI r20, BUF
    STRO r20, "64K RAM  0x000-0x3FF=Source"
    LDI r6, 0xAAAACC
    JMP hl_draw

hl_tips1:
    LDI r20, BUF
    STRO r20, "Tips"
    LDI r6, 0x8888FF
    JMP hl_draw

hl_tips2:
    LDI r20, BUF
    STRO r20, "r13 reserved for CMP results"
    LDI r6, 0xAAAACC
    JMP hl_draw

hl_tips3:
    LDI r20, BUF
    STRO r20, "r30=SP r31=LR (CALL/RET)"
    LDI r6, 0xAAAACC
    JMP hl_draw

hl_tips4:
    LDI r20, BUF
    STRO r20, "No colons in .asm comments"
    LDI r6, 0xFF8888
    JMP hl_draw

hl_tips5:
    LDI r20, BUF
    STRO r20, "FRAME for animation loops"
    LDI r6, 0xAAAACC
    JMP hl_draw

hl_tips6:
    LDI r20, BUF
    STRO r20, "IKEY reads keyboard each frame"
    LDI r6, 0xAAAACC
    JMP hl_draw

hl_blank:
    LDI r20, BUF
    STRO r20, ""
    LDI r6, 0xAAAACC

hl_draw:
    LDI r8, 16
    MOV r4, r9
    LDI r7, BUF
    LDI r2, 0x101828
    DRAWTEXT r8, r4, r7, r6, r2

    ; Next line
    LDI r1, 1
    ADD r0, r1
    LDI r1, 16
    ADD r9, r1
    JMP help_line_loop

help_lines_done:
    ; Footer
    LDI r8, 0
    LDI r4, 244
    LDI r7, 256
    LDI r6, 12
    LDI r2, 0x0A0A1A
    RECTF r8, r4, r7, r6, r2

    LDI r20, BUF
    STRO r20, "Up/Down: Scroll  ESC: Back"
    LDI r8, 52
    LDI r4, 246
    LDI r7, BUF
    LDI r6, 0x6666AA
    LDI r2, 0x0A0A1A
    DRAWTEXT r8, r4, r7, r6, r2

    POP r31
    RET
