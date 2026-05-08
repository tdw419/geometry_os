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
LDI r3, 1

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
    LDI r8, 65
    CMP r10, r8
    JZ r7, scroll_up

    ; Down arrow (B=66) = scroll down
    LDI r8, 66
    CMP r10, r8
    JZ r7, scroll_down

    ; ESC (27) = quit
    LDI r8, 27
    CMP r10, r8
    JZ r7, help_quit

    JMP no_input

scroll_up:
    LDI r20, SCROLL
    LOAD r14, r20
    JZ r14, no_input
    LDI r8, 1
    SUB r14, r8
    STORE r20, r14
    JMP no_input

scroll_down:
    LDI r20, SCROLL
    LOAD r14, r20
    LDI r20, MAXSCRL
    LOAD r16, r20
    CMP r14, r16
    BGE r7, no_input
    LDI r20, SCROLL
    LOAD r14, r20
    LDI r8, 1
    ADD r14, r8
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
    LDI r3, 0x0D1B2A
    FILL r3

    ; Title bar
    LDI r3, 0
    LDI r5, 0
    LDI r9, 256
    LDI r4, 24
    LDI r2, 0x1B3A5C
    RECTF r3, r5, r9, r4, r2

    LDI r20, BUF
    STRO r20, "Geometry OS Help"
    LDI r3, 56
    LDI r5, 6
    LDI r9, BUF
    LDI r4, 0xFFFFFF
    LDI r2, 0x1B3A5C
    DRAWTEXT r3, r5, r9, r4, r2

    ; Content area background
    LDI r3, 8
    LDI r5, 28
    LDI r9, 240
    LDI r4, 216
    LDI r2, 0x101828
    RECTF r3, r5, r9, r4, r2

    ; Load scroll offset
    LDI r20, SCROLL
    LOAD r1, r20

    ; Draw help lines based on scroll offset
    ; Each line is 16px apart, starting at y=34
    ; We draw up to 13 visible lines

    ; Line 0 (relative to scroll)
    LDI r12, 0            ; line index
    LDI r6, 34           ; y position

help_line_loop:
    ; Check if we've drawn enough lines (13 visible)
    LDI r14, 13
    CMP r12, r14
    BGE r7, help_lines_done

    ; Compute which help entry to show: scroll_offset + line_index
    MOV r14, r1
    ADD r14, r12

    ; Dispatch on help entry index
    JZ r14, hl_keyboard
    LDI r8, 1
    CMP r14, r8
    JZ r7, hl_keys2
    LDI r8, 2
    CMP r14, r8
    JZ r7, hl_opcodes1
    LDI r8, 3
    CMP r14, r8
    JZ r7, hl_opcodes2
    LDI r8, 4
    CMP r14, r8
    JZ r7, hl_opcodes3
    LDI r8, 5
    CMP r14, r8
    JZ r7, hl_shell
    LDI r8, 6
    CMP r14, r8
    JZ r7, hl_memory
    LDI r8, 7
    CMP r14, r8
    JZ r7, hl_tips1
    LDI r8, 8
    CMP r14, r8
    JZ r7, hl_tips2
    LDI r8, 9
    CMP r14, r8
    JZ r7, hl_tips3
    LDI r8, 10
    CMP r14, r8
    JZ r7, hl_tips4
    LDI r8, 11
    CMP r14, r8
    JZ r7, hl_tips5
    LDI r8, 12
    CMP r14, r8
    JZ r7, hl_tips6
    JMP hl_blank

hl_keyboard:
    LDI r20, BUF
    STRO r20, "Keyboard Shortcuts"
    LDI r4, 0x8888FF
    JMP hl_draw

hl_keys2:
    LDI r20, BUF
    STRO r20, "F5=Run F8=Asm F6=Step ESC=Back"
    LDI r4, 0xAAAACC
    JMP hl_draw

hl_opcodes1:
    LDI r20, BUF
    STRO r20, "Opcodes (113 total)"
    LDI r4, 0x8888FF
    JMP hl_draw

hl_opcodes2:
    LDI r20, BUF
    STRO r20, "LDI LOAD STORE MOV ADD SUB MUL"
    LDI r4, 0xAAAACC
    JMP hl_draw

hl_opcodes3:
    LDI r20, BUF
    STRO r20, "DIV AND OR XOR SHL SHR MOD NEG"
    LDI r4, 0xAAAACC
    JMP hl_draw

hl_shell:
    LDI r20, BUF
    STRO r20, "Shell: help ls load run edit regs"
    LDI r4, 0xAAAACC
    JMP hl_draw

hl_memory:
    LDI r20, BUF
    STRO r20, "64K RAM  0x000-0x3FF=Source"
    LDI r4, 0xAAAACC
    JMP hl_draw

hl_tips1:
    LDI r20, BUF
    STRO r20, "Tips"
    LDI r4, 0x8888FF
    JMP hl_draw

hl_tips2:
    LDI r20, BUF
    STRO r20, "r7 reserved for CMP results"
    LDI r4, 0xAAAACC
    JMP hl_draw

hl_tips3:
    LDI r20, BUF
    STRO r20, "r30=SP r31=LR (CALL/RET)"
    LDI r4, 0xAAAACC
    JMP hl_draw

hl_tips4:
    LDI r20, BUF
    STRO r20, "No colons in .asm comments"
    LDI r4, 0xFF8888
    JMP hl_draw

hl_tips5:
    LDI r20, BUF
    STRO r20, "FRAME for animation loops"
    LDI r4, 0xAAAACC
    JMP hl_draw

hl_tips6:
    LDI r20, BUF
    STRO r20, "IKEY reads keyboard each frame"
    LDI r4, 0xAAAACC
    JMP hl_draw

hl_blank:
    LDI r20, BUF
    STRO r20, ""
    LDI r4, 0xAAAACC

hl_draw:
    LDI r3, 16
    MOV r5, r6
    LDI r9, BUF
    LDI r2, 0x101828
    DRAWTEXT r3, r5, r9, r4, r2

    ; Next line
    LDI r14, 1
    ADD r12, r14
    LDI r14, 16
    ADD r6, r14
    JMP help_line_loop

help_lines_done:
    ; Footer
    LDI r3, 0
    LDI r5, 244
    LDI r9, 256
    LDI r4, 12
    LDI r2, 0x0A0A1A
    RECTF r3, r5, r9, r4, r2

    LDI r20, BUF
    STRO r20, "Up/Down: Scroll  ESC: Back"
    LDI r3, 52
    LDI r5, 246
    LDI r9, BUF
    LDI r4, 0x6666AA
    LDI r2, 0x0A0A1A
    DRAWTEXT r3, r5, r9, r4, r2

    POP r31
    RET
