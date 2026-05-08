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
    IKEY r15
    JZ r15, no_input

    ; Up arrow (A=65) = scroll up
    LDI r8, 65
    CMP r15, r8
    JZ r4, scroll_up

    ; Down arrow (B=66) = scroll down
    LDI r8, 66
    CMP r15, r8
    JZ r4, scroll_down

    ; ESC (27) = quit
    LDI r8, 27
    CMP r15, r8
    JZ r4, help_quit

    JMP no_input

scroll_up:
    LDI r20, SCROLL
    LOAD r0, r20
    JZ r0, no_input
    LDI r8, 1
    SUB r0, r8
    STORE r20, r0
    JMP no_input

scroll_down:
    LDI r20, SCROLL
    LOAD r0, r20
    LDI r20, MAXSCRL
    LOAD r16, r20
    CMP r0, r16
    BGE r4, no_input
    LDI r20, SCROLL
    LOAD r0, r20
    LDI r8, 1
    ADD r0, r8
    STORE r20, r0
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
    LDI r3, 0
    LDI r9, 256
    LDI r10, 24
    LDI r12, 0x1B3A5C
    RECTF r13, r3, r9, r10, r12

    LDI r20, BUF
    STRO r20, "Geometry OS Help"
    LDI r13, 56
    LDI r3, 6
    LDI r9, BUF
    LDI r10, 0xFFFFFF
    LDI r12, 0x1B3A5C
    DRAWTEXT r13, r3, r9, r10, r12

    ; Content area background
    LDI r13, 8
    LDI r3, 28
    LDI r9, 240
    LDI r10, 216
    LDI r12, 0x101828
    RECTF r13, r3, r9, r10, r12

    ; Load scroll offset
    LDI r20, SCROLL
    LOAD r1, r20

    ; Draw help lines based on scroll offset
    ; Each line is 16px apart, starting at y=34
    ; We draw up to 13 visible lines

    ; Line 0 (relative to scroll)
    LDI r2, 0            ; line index
    LDI r6, 34           ; y position

help_line_loop:
    ; Check if we've drawn enough lines (13 visible)
    LDI r0, 13
    CMP r2, r0
    BGE r4, help_lines_done

    ; Compute which help entry to show: scroll_offset + line_index
    MOV r0, r1
    ADD r0, r2

    ; Dispatch on help entry index
    JZ r0, hl_keyboard
    LDI r8, 1
    CMP r0, r8
    JZ r4, hl_keys2
    LDI r8, 2
    CMP r0, r8
    JZ r4, hl_opcodes1
    LDI r8, 3
    CMP r0, r8
    JZ r4, hl_opcodes2
    LDI r8, 4
    CMP r0, r8
    JZ r4, hl_opcodes3
    LDI r8, 5
    CMP r0, r8
    JZ r4, hl_shell
    LDI r8, 6
    CMP r0, r8
    JZ r4, hl_memory
    LDI r8, 7
    CMP r0, r8
    JZ r4, hl_tips1
    LDI r8, 8
    CMP r0, r8
    JZ r4, hl_tips2
    LDI r8, 9
    CMP r0, r8
    JZ r4, hl_tips3
    LDI r8, 10
    CMP r0, r8
    JZ r4, hl_tips4
    LDI r8, 11
    CMP r0, r8
    JZ r4, hl_tips5
    LDI r8, 12
    CMP r0, r8
    JZ r4, hl_tips6
    JMP hl_blank

hl_keyboard:
    LDI r20, BUF
    STRO r20, "Keyboard Shortcuts"
    LDI r10, 0x8888FF
    JMP hl_draw

hl_keys2:
    LDI r20, BUF
    STRO r20, "F5=Run F8=Asm F6=Step ESC=Back"
    LDI r10, 0xAAAACC
    JMP hl_draw

hl_opcodes1:
    LDI r20, BUF
    STRO r20, "Opcodes (113 total)"
    LDI r10, 0x8888FF
    JMP hl_draw

hl_opcodes2:
    LDI r20, BUF
    STRO r20, "LDI LOAD STORE MOV ADD SUB MUL"
    LDI r10, 0xAAAACC
    JMP hl_draw

hl_opcodes3:
    LDI r20, BUF
    STRO r20, "DIV AND OR XOR SHL SHR MOD NEG"
    LDI r10, 0xAAAACC
    JMP hl_draw

hl_shell:
    LDI r20, BUF
    STRO r20, "Shell: help ls load run edit regs"
    LDI r10, 0xAAAACC
    JMP hl_draw

hl_memory:
    LDI r20, BUF
    STRO r20, "64K RAM  0x000-0x3FF=Source"
    LDI r10, 0xAAAACC
    JMP hl_draw

hl_tips1:
    LDI r20, BUF
    STRO r20, "Tips"
    LDI r10, 0x8888FF
    JMP hl_draw

hl_tips2:
    LDI r20, BUF
    STRO r20, "r4 reserved for CMP results"
    LDI r10, 0xAAAACC
    JMP hl_draw

hl_tips3:
    LDI r20, BUF
    STRO r20, "r30=SP r31=LR (CALL/RET)"
    LDI r10, 0xAAAACC
    JMP hl_draw

hl_tips4:
    LDI r20, BUF
    STRO r20, "No colons in .asm comments"
    LDI r10, 0xFF8888
    JMP hl_draw

hl_tips5:
    LDI r20, BUF
    STRO r20, "FRAME for animation loops"
    LDI r10, 0xAAAACC
    JMP hl_draw

hl_tips6:
    LDI r20, BUF
    STRO r20, "IKEY reads keyboard each frame"
    LDI r10, 0xAAAACC
    JMP hl_draw

hl_blank:
    LDI r20, BUF
    STRO r20, ""
    LDI r10, 0xAAAACC

hl_draw:
    LDI r13, 16
    MOV r3, r6
    LDI r9, BUF
    LDI r12, 0x101828
    DRAWTEXT r13, r3, r9, r10, r12

    ; Next line
    LDI r0, 1
    ADD r2, r0
    LDI r0, 16
    ADD r6, r0
    JMP help_line_loop

help_lines_done:
    ; Footer
    LDI r13, 0
    LDI r3, 244
    LDI r9, 256
    LDI r10, 12
    LDI r12, 0x0A0A1A
    RECTF r13, r3, r9, r10, r12

    LDI r20, BUF
    STRO r20, "Up/Down: Scroll  ESC: Back"
    LDI r13, 52
    LDI r3, 246
    LDI r9, BUF
    LDI r10, 0x6666AA
    LDI r12, 0x0A0A1A
    DRAWTEXT r13, r3, r9, r10, r12

    POP r31
    RET
