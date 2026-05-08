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
LDI r15, 1

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
    IKEY r8
    JZ r8, no_input

    ; Up arrow (A=65) = scroll up
    LDI r3, 65
    CMP r8, r3
    JZ r1, scroll_up

    ; Down arrow (B=66) = scroll down
    LDI r3, 66
    CMP r8, r3
    JZ r1, scroll_down

    ; ESC (27) = quit
    LDI r3, 27
    CMP r8, r3
    JZ r1, help_quit

    JMP no_input

scroll_up:
    LDI r20, SCROLL
    LOAD r5, r20
    JZ r5, no_input
    LDI r3, 1
    SUB r5, r3
    STORE r20, r5
    JMP no_input

scroll_down:
    LDI r20, SCROLL
    LOAD r5, r20
    LDI r20, MAXSCRL
    LOAD r16, r20
    CMP r5, r16
    BGE r1, no_input
    LDI r20, SCROLL
    LOAD r5, r20
    LDI r3, 1
    ADD r5, r3
    STORE r20, r5
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
    LDI r15, 0x0D1B2A
    FILL r15

    ; Title bar
    LDI r15, 0
    LDI r0, 0
    LDI r11, 256
    LDI r2, 24
    LDI r6, 0x1B3A5C
    RECTF r15, r0, r11, r2, r6

    LDI r20, BUF
    STRO r20, "Geometry OS Help"
    LDI r15, 56
    LDI r0, 6
    LDI r11, BUF
    LDI r2, 0xFFFFFF
    LDI r6, 0x1B3A5C
    DRAWTEXT r15, r0, r11, r2, r6

    ; Content area background
    LDI r15, 8
    LDI r0, 28
    LDI r11, 240
    LDI r2, 216
    LDI r6, 0x101828
    RECTF r15, r0, r11, r2, r6

    ; Load scroll offset
    LDI r20, SCROLL
    LOAD r14, r20

    ; Draw help lines based on scroll offset
    ; Each line is 16px apart, starting at y=34
    ; We draw up to 13 visible lines

    ; Line 0 (relative to scroll)
    LDI r4, 0            ; line index
    LDI r9, 34           ; y position

help_line_loop:
    ; Check if we've drawn enough lines (13 visible)
    LDI r5, 13
    CMP r4, r5
    BGE r1, help_lines_done

    ; Compute which help entry to show: scroll_offset + line_index
    MOV r5, r14
    ADD r5, r4

    ; Dispatch on help entry index
    JZ r5, hl_keyboard
    LDI r3, 1
    CMP r5, r3
    JZ r1, hl_keys2
    LDI r3, 2
    CMP r5, r3
    JZ r1, hl_opcodes1
    LDI r3, 3
    CMP r5, r3
    JZ r1, hl_opcodes2
    LDI r3, 4
    CMP r5, r3
    JZ r1, hl_opcodes3
    LDI r3, 5
    CMP r5, r3
    JZ r1, hl_shell
    LDI r3, 6
    CMP r5, r3
    JZ r1, hl_memory
    LDI r3, 7
    CMP r5, r3
    JZ r1, hl_tips1
    LDI r3, 8
    CMP r5, r3
    JZ r1, hl_tips2
    LDI r3, 9
    CMP r5, r3
    JZ r1, hl_tips3
    LDI r3, 10
    CMP r5, r3
    JZ r1, hl_tips4
    LDI r3, 11
    CMP r5, r3
    JZ r1, hl_tips5
    LDI r3, 12
    CMP r5, r3
    JZ r1, hl_tips6
    JMP hl_blank

hl_keyboard:
    LDI r20, BUF
    STRO r20, "Keyboard Shortcuts"
    LDI r2, 0x8888FF
    JMP hl_draw

hl_keys2:
    LDI r20, BUF
    STRO r20, "F5=Run F8=Asm F6=Step ESC=Back"
    LDI r2, 0xAAAACC
    JMP hl_draw

hl_opcodes1:
    LDI r20, BUF
    STRO r20, "Opcodes (113 total)"
    LDI r2, 0x8888FF
    JMP hl_draw

hl_opcodes2:
    LDI r20, BUF
    STRO r20, "LDI LOAD STORE MOV ADD SUB MUL"
    LDI r2, 0xAAAACC
    JMP hl_draw

hl_opcodes3:
    LDI r20, BUF
    STRO r20, "DIV AND OR XOR SHL SHR MOD NEG"
    LDI r2, 0xAAAACC
    JMP hl_draw

hl_shell:
    LDI r20, BUF
    STRO r20, "Shell: help ls load run edit regs"
    LDI r2, 0xAAAACC
    JMP hl_draw

hl_memory:
    LDI r20, BUF
    STRO r20, "64K RAM  0x000-0x3FF=Source"
    LDI r2, 0xAAAACC
    JMP hl_draw

hl_tips1:
    LDI r20, BUF
    STRO r20, "Tips"
    LDI r2, 0x8888FF
    JMP hl_draw

hl_tips2:
    LDI r20, BUF
    STRO r20, "r1 reserved for CMP results"
    LDI r2, 0xAAAACC
    JMP hl_draw

hl_tips3:
    LDI r20, BUF
    STRO r20, "r30=SP r31=LR (CALL/RET)"
    LDI r2, 0xAAAACC
    JMP hl_draw

hl_tips4:
    LDI r20, BUF
    STRO r20, "No colons in .asm comments"
    LDI r2, 0xFF8888
    JMP hl_draw

hl_tips5:
    LDI r20, BUF
    STRO r20, "FRAME for animation loops"
    LDI r2, 0xAAAACC
    JMP hl_draw

hl_tips6:
    LDI r20, BUF
    STRO r20, "IKEY reads keyboard each frame"
    LDI r2, 0xAAAACC
    JMP hl_draw

hl_blank:
    LDI r20, BUF
    STRO r20, ""
    LDI r2, 0xAAAACC

hl_draw:
    LDI r15, 16
    MOV r0, r9
    LDI r11, BUF
    LDI r6, 0x101828
    DRAWTEXT r15, r0, r11, r2, r6

    ; Next line
    LDI r5, 1
    ADD r4, r5
    LDI r5, 16
    ADD r9, r5
    JMP help_line_loop

help_lines_done:
    ; Footer
    LDI r15, 0
    LDI r0, 244
    LDI r11, 256
    LDI r2, 12
    LDI r6, 0x0A0A1A
    RECTF r15, r0, r11, r2, r6

    LDI r20, BUF
    STRO r20, "Up/Down: Scroll  ESC: Back"
    LDI r15, 52
    LDI r0, 246
    LDI r11, BUF
    LDI r2, 0x6666AA
    LDI r6, 0x0A0A1A
    DRAWTEXT r15, r0, r11, r2, r6

    POP r31
    RET
