; DESCRIPTION: Render a colored rectangle at the screen.

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
LDI r13, 1

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
    IKEY r10
    JZ r10, no_input

    ; Up arrow (A=65) = scroll up
    LDI r11, 65
    CMP r10, r11
    JZ r4, scroll_up

    ; Down arrow (B=66) = scroll down
    LDI r11, 66
    CMP r10, r11
    JZ r4, scroll_down

    ; ESC (27) = quit
    LDI r11, 27
    CMP r10, r11
    JZ r4, help_quit

    JMP no_input

scroll_up:
    LDI r20, SCROLL
    LOAD r1, r20
    JZ r1, no_input
    LDI r11, 1
    SUB r1, r11
    STORE r20, r1
    JMP no_input

scroll_down:
    LDI r20, SCROLL
    LOAD r1, r20
    LDI r20, MAXSCRL
    LOAD r16, r20
    CMP r1, r16
    BGE r4, no_input
    LDI r20, SCROLL
    LOAD r1, r20
    LDI r11, 1
    ADD r1, r11
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
    LDI r13, 0x0D1B2A
    FILL r13

    ; Title bar
    LDI r13, 0
    LDI r8, 0
    LDI r6, 256
    LDI r14, 24
    LDI r0, 0x1B3A5C
    RECTF r13, r8, r6, r14, r0

    LDI r20, BUF
    STRO r20, "Geometry OS Help"
    LDI r13, 56
    LDI r8, 6
    LDI r6, BUF
    LDI r14, 0xFFFFFF
    LDI r0, 0x1B3A5C
    DRAWTEXT r13, r8, r6, r14, r0

    ; Content area background
    LDI r13, 8
    LDI r8, 28
    LDI r6, 240
    LDI r14, 216
    LDI r0, 0x101828
    RECTF r13, r8, r6, r14, r0

    ; Load scroll offset
    LDI r20, SCROLL
    LOAD r15, r20

    ; Draw help lines based on scroll offset
    ; Each line is 16px apart, starting at y=34
    ; We draw up to 13 visible lines

    ; Line 0 (relative to scroll)
    LDI r3, 0            ; line index
    LDI r2, 34           ; y position

help_line_loop:
    ; Check if we've drawn enough lines (13 visible)
    LDI r1, 13
    CMP r3, r1
    BGE r4, help_lines_done

    ; Compute which help entry to show: scroll_offset + line_index
    MOV r1, r15
    ADD r1, r3

    ; Dispatch on help entry index
    JZ r1, hl_keyboard
    LDI r11, 1
    CMP r1, r11
    JZ r4, hl_keys2
    LDI r11, 2
    CMP r1, r11
    JZ r4, hl_opcodes1
    LDI r11, 3
    CMP r1, r11
    JZ r4, hl_opcodes2
    LDI r11, 4
    CMP r1, r11
    JZ r4, hl_opcodes3
    LDI r11, 5
    CMP r1, r11
    JZ r4, hl_shell
    LDI r11, 6
    CMP r1, r11
    JZ r4, hl_memory
    LDI r11, 7
    CMP r1, r11
    JZ r4, hl_tips1
    LDI r11, 8
    CMP r1, r11
    JZ r4, hl_tips2
    LDI r11, 9
    CMP r1, r11
    JZ r4, hl_tips3
    LDI r11, 10
    CMP r1, r11
    JZ r4, hl_tips4
    LDI r11, 11
    CMP r1, r11
    JZ r4, hl_tips5
    LDI r11, 12
    CMP r1, r11
    JZ r4, hl_tips6
    JMP hl_blank

hl_keyboard:
    LDI r20, BUF
    STRO r20, "Keyboard Shortcuts"
    LDI r14, 0x8888FF
    JMP hl_draw

hl_keys2:
    LDI r20, BUF
    STRO r20, "F5=Run F8=Asm F6=Step ESC=Back"
    LDI r14, 0xAAAACC
    JMP hl_draw

hl_opcodes1:
    LDI r20, BUF
    STRO r20, "Opcodes (113 total)"
    LDI r14, 0x8888FF
    JMP hl_draw

hl_opcodes2:
    LDI r20, BUF
    STRO r20, "LDI LOAD STORE MOV ADD SUB MUL"
    LDI r14, 0xAAAACC
    JMP hl_draw

hl_opcodes3:
    LDI r20, BUF
    STRO r20, "DIV AND OR XOR SHL SHR MOD NEG"
    LDI r14, 0xAAAACC
    JMP hl_draw

hl_shell:
    LDI r20, BUF
    STRO r20, "Shell: help ls load run edit regs"
    LDI r14, 0xAAAACC
    JMP hl_draw

hl_memory:
    LDI r20, BUF
    STRO r20, "64K RAM  0x000-0x3FF=Source"
    LDI r14, 0xAAAACC
    JMP hl_draw

hl_tips1:
    LDI r20, BUF
    STRO r20, "Tips"
    LDI r14, 0x8888FF
    JMP hl_draw

hl_tips2:
    LDI r20, BUF
    STRO r20, "r4 reserved for CMP results"
    LDI r14, 0xAAAACC
    JMP hl_draw

hl_tips3:
    LDI r20, BUF
    STRO r20, "r30=SP r31=LR (CALL/RET)"
    LDI r14, 0xAAAACC
    JMP hl_draw

hl_tips4:
    LDI r20, BUF
    STRO r20, "No colons in .asm comments"
    LDI r14, 0xFF8888
    JMP hl_draw

hl_tips5:
    LDI r20, BUF
    STRO r20, "FRAME for animation loops"
    LDI r14, 0xAAAACC
    JMP hl_draw

hl_tips6:
    LDI r20, BUF
    STRO r20, "IKEY reads keyboard each frame"
    LDI r14, 0xAAAACC
    JMP hl_draw

hl_blank:
    LDI r20, BUF
    STRO r20, ""
    LDI r14, 0xAAAACC

hl_draw:
    LDI r13, 16
    MOV r8, r2
    LDI r6, BUF
    LDI r0, 0x101828
    DRAWTEXT r13, r8, r6, r14, r0

    ; Next line
    LDI r1, 1
    ADD r3, r1
    LDI r1, 16
    ADD r2, r1
    JMP help_line_loop

help_lines_done:
    ; Footer
    LDI r13, 0
    LDI r8, 244
    LDI r6, 256
    LDI r14, 12
    LDI r0, 0x0A0A1A
    RECTF r13, r8, r6, r14, r0

    LDI r20, BUF
    STRO r20, "Up/Down: Scroll  ESC: Back"
    LDI r13, 52
    LDI r8, 246
    LDI r6, BUF
    LDI r14, 0x6666AA
    LDI r0, 0x0A0A1A
    DRAWTEXT r13, r8, r6, r14, r0

    POP r31
    RET
