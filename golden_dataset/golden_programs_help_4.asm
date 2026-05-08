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
LDI r6, 1

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
    IKEY r7
    JZ r7, no_input

    ; Up arrow (A=65) = scroll up
    LDI r4, 65
    CMP r7, r4
    JZ r10, scroll_up

    ; Down arrow (B=66) = scroll down
    LDI r4, 66
    CMP r7, r4
    JZ r10, scroll_down

    ; ESC (27) = quit
    LDI r4, 27
    CMP r7, r4
    JZ r10, help_quit

    JMP no_input

scroll_up:
    LDI r20, SCROLL
    LOAD r8, r20
    JZ r8, no_input
    LDI r4, 1
    SUB r8, r4
    STORE r20, r8
    JMP no_input

scroll_down:
    LDI r20, SCROLL
    LOAD r8, r20
    LDI r20, MAXSCRL
    LOAD r16, r20
    CMP r8, r16
    BGE r10, no_input
    LDI r20, SCROLL
    LOAD r8, r20
    LDI r4, 1
    ADD r8, r4
    STORE r20, r8
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
    LDI r6, 0x0D1B2A
    FILL r6

    ; Title bar
    LDI r6, 0
    LDI r2, 0
    LDI r13, 256
    LDI r3, 24
    LDI r9, 0x1B3A5C
    RECTF r6, r2, r13, r3, r9

    LDI r20, BUF
    STRO r20, "Geometry OS Help"
    LDI r6, 56
    LDI r2, 6
    LDI r13, BUF
    LDI r3, 0xFFFFFF
    LDI r9, 0x1B3A5C
    DRAWTEXT r6, r2, r13, r3, r9

    ; Content area background
    LDI r6, 8
    LDI r2, 28
    LDI r13, 240
    LDI r3, 216
    LDI r9, 0x101828
    RECTF r6, r2, r13, r3, r9

    ; Load scroll offset
    LDI r20, SCROLL
    LOAD r14, r20

    ; Draw help lines based on scroll offset
    ; Each line is 16px apart, starting at y=34
    ; We draw up to 13 visible lines

    ; Line 0 (relative to scroll)
    LDI r12, 0            ; line index
    LDI r1, 34           ; y position

help_line_loop:
    ; Check if we've drawn enough lines (13 visible)
    LDI r8, 13
    CMP r12, r8
    BGE r10, help_lines_done

    ; Compute which help entry to show: scroll_offset + line_index
    MOV r8, r14
    ADD r8, r12

    ; Dispatch on help entry index
    JZ r8, hl_keyboard
    LDI r4, 1
    CMP r8, r4
    JZ r10, hl_keys2
    LDI r4, 2
    CMP r8, r4
    JZ r10, hl_opcodes1
    LDI r4, 3
    CMP r8, r4
    JZ r10, hl_opcodes2
    LDI r4, 4
    CMP r8, r4
    JZ r10, hl_opcodes3
    LDI r4, 5
    CMP r8, r4
    JZ r10, hl_shell
    LDI r4, 6
    CMP r8, r4
    JZ r10, hl_memory
    LDI r4, 7
    CMP r8, r4
    JZ r10, hl_tips1
    LDI r4, 8
    CMP r8, r4
    JZ r10, hl_tips2
    LDI r4, 9
    CMP r8, r4
    JZ r10, hl_tips3
    LDI r4, 10
    CMP r8, r4
    JZ r10, hl_tips4
    LDI r4, 11
    CMP r8, r4
    JZ r10, hl_tips5
    LDI r4, 12
    CMP r8, r4
    JZ r10, hl_tips6
    JMP hl_blank

hl_keyboard:
    LDI r20, BUF
    STRO r20, "Keyboard Shortcuts"
    LDI r3, 0x8888FF
    JMP hl_draw

hl_keys2:
    LDI r20, BUF
    STRO r20, "F5=Run F8=Asm F6=Step ESC=Back"
    LDI r3, 0xAAAACC
    JMP hl_draw

hl_opcodes1:
    LDI r20, BUF
    STRO r20, "Opcodes (113 total)"
    LDI r3, 0x8888FF
    JMP hl_draw

hl_opcodes2:
    LDI r20, BUF
    STRO r20, "LDI LOAD STORE MOV ADD SUB MUL"
    LDI r3, 0xAAAACC
    JMP hl_draw

hl_opcodes3:
    LDI r20, BUF
    STRO r20, "DIV AND OR XOR SHL SHR MOD NEG"
    LDI r3, 0xAAAACC
    JMP hl_draw

hl_shell:
    LDI r20, BUF
    STRO r20, "Shell: help ls load run edit regs"
    LDI r3, 0xAAAACC
    JMP hl_draw

hl_memory:
    LDI r20, BUF
    STRO r20, "64K RAM  0x000-0x3FF=Source"
    LDI r3, 0xAAAACC
    JMP hl_draw

hl_tips1:
    LDI r20, BUF
    STRO r20, "Tips"
    LDI r3, 0x8888FF
    JMP hl_draw

hl_tips2:
    LDI r20, BUF
    STRO r20, "r10 reserved for CMP results"
    LDI r3, 0xAAAACC
    JMP hl_draw

hl_tips3:
    LDI r20, BUF
    STRO r20, "r30=SP r31=LR (CALL/RET)"
    LDI r3, 0xAAAACC
    JMP hl_draw

hl_tips4:
    LDI r20, BUF
    STRO r20, "No colons in .asm comments"
    LDI r3, 0xFF8888
    JMP hl_draw

hl_tips5:
    LDI r20, BUF
    STRO r20, "FRAME for animation loops"
    LDI r3, 0xAAAACC
    JMP hl_draw

hl_tips6:
    LDI r20, BUF
    STRO r20, "IKEY reads keyboard each frame"
    LDI r3, 0xAAAACC
    JMP hl_draw

hl_blank:
    LDI r20, BUF
    STRO r20, ""
    LDI r3, 0xAAAACC

hl_draw:
    LDI r6, 16
    MOV r2, r1
    LDI r13, BUF
    LDI r9, 0x101828
    DRAWTEXT r6, r2, r13, r3, r9

    ; Next line
    LDI r8, 1
    ADD r12, r8
    LDI r8, 16
    ADD r1, r8
    JMP help_line_loop

help_lines_done:
    ; Footer
    LDI r6, 0
    LDI r2, 244
    LDI r13, 256
    LDI r3, 12
    LDI r9, 0x0A0A1A
    RECTF r6, r2, r13, r3, r9

    LDI r20, BUF
    STRO r20, "Up/Down: Scroll  ESC: Back"
    LDI r6, 52
    LDI r2, 246
    LDI r13, BUF
    LDI r3, 0x6666AA
    LDI r9, 0x0A0A1A
    DRAWTEXT r6, r2, r13, r3, r9

    POP r31
    RET
