; DESCRIPTION: This GeOS assembly code implements a help viewer that displays keyboard shortcuts, opcode references, and shell commands from pre-loaded text in RAM. The interface is scrollable using the arrow keys, and it includes a title bar, content area background, and footer with navigation instructions. The code also demonstrates text rendering, rectangle drawing, and keyboard input handling within a loop.

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
LDI r4, 1

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
    IKEY r0
    JZ r0, no_input

    ; Up arrow (A=65) = scroll up
    LDI r10, 65
    CMP r0, r10
    JZ r14, scroll_up

    ; Down arrow (B=66) = scroll down
    LDI r10, 66
    CMP r0, r10
    JZ r14, scroll_down

    ; ESC (27) = quit
    LDI r10, 27
    CMP r0, r10
    JZ r14, help_quit

    JMP no_input

scroll_up:
    LDI r20, SCROLL
    LOAD r13, r20
    JZ r13, no_input
    LDI r10, 1
    SUB r13, r10
    STORE r20, r13
    JMP no_input

scroll_down:
    LDI r20, SCROLL
    LOAD r13, r20
    LDI r20, MAXSCRL
    LOAD r16, r20
    CMP r13, r16
    BGE r14, no_input
    LDI r20, SCROLL
    LOAD r13, r20
    LDI r10, 1
    ADD r13, r10
    STORE r20, r13
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
    LDI r4, 0x0D1B2A
    FILL r4

    ; Title bar
    LDI r4, 0
    LDI r2, 0
    LDI r1, 256
    LDI r6, 24
    LDI r11, 0x1B3A5C
    RECTF r4, r2, r1, r6, r11

    LDI r20, BUF
    STRO r20, "Geometry OS Help"
    LDI r4, 56
    LDI r2, 6
    LDI r1, BUF
    LDI r6, 0xFFFFFF
    LDI r11, 0x1B3A5C
    DRAWTEXT r4, r2, r1, r6, r11

    ; Content area background
    LDI r4, 8
    LDI r2, 28
    LDI r1, 240
    LDI r6, 216
    LDI r11, 0x101828
    RECTF r4, r2, r1, r6, r11

    ; Load scroll offset
    LDI r20, SCROLL
    LOAD r8, r20

    ; Draw help lines based on scroll offset
    ; Each line is 16px apart, starting at y=34
    ; We draw up to 13 visible lines

    ; Line 0 (relative to scroll)
    LDI r15, 0            ; line index
    LDI r5, 34           ; y position

help_line_loop:
    ; Check if we've drawn enough lines (13 visible)
    LDI r13, 13
    CMP r15, r13
    BGE r14, help_lines_done

    ; Compute which help entry to show: scroll_offset + line_index
    MOV r13, r8
    ADD r13, r15

    ; Dispatch on help entry index
    JZ r13, hl_keyboard
    LDI r10, 1
    CMP r13, r10
    JZ r14, hl_keys2
    LDI r10, 2
    CMP r13, r10
    JZ r14, hl_opcodes1
    LDI r10, 3
    CMP r13, r10
    JZ r14, hl_opcodes2
    LDI r10, 4
    CMP r13, r10
    JZ r14, hl_opcodes3
    LDI r10, 5
    CMP r13, r10
    JZ r14, hl_shell
    LDI r10, 6
    CMP r13, r10
    JZ r14, hl_memory
    LDI r10, 7
    CMP r13, r10
    JZ r14, hl_tips1
    LDI r10, 8
    CMP r13, r10
    JZ r14, hl_tips2
    LDI r10, 9
    CMP r13, r10
    JZ r14, hl_tips3
    LDI r10, 10
    CMP r13, r10
    JZ r14, hl_tips4
    LDI r10, 11
    CMP r13, r10
    JZ r14, hl_tips5
    LDI r10, 12
    CMP r13, r10
    JZ r14, hl_tips6
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
    STRO r20, "r14 reserved for CMP results"
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
    LDI r4, 16
    MOV r2, r5
    LDI r1, BUF
    LDI r11, 0x101828
    DRAWTEXT r4, r2, r1, r6, r11

    ; Next line
    LDI r13, 1
    ADD r15, r13
    LDI r13, 16
    ADD r5, r13
    JMP help_line_loop

help_lines_done:
    ; Footer
    LDI r4, 0
    LDI r2, 244
    LDI r1, 256
    LDI r6, 12
    LDI r11, 0x0A0A1A
    RECTF r4, r2, r1, r6, r11

    LDI r20, BUF
    STRO r20, "Up/Down: Scroll  ESC: Back"
    LDI r4, 52
    LDI r2, 246
    LDI r1, BUF
    LDI r6, 0x6666AA
    LDI r11, 0x0A0A1A
    DRAWTEXT r4, r2, r1, r6, r11

    POP r31
    RET
