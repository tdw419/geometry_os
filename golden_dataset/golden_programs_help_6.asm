; DESCRIPTION: Draws a colored rectangle at the screen with fixed size.

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
LDI r7, 1

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
    IKEY r4
    JZ r4, no_input

    ; Up arrow (A=65) = scroll up
    LDI r6, 65
    CMP r4, r6
    JZ r1, scroll_up

    ; Down arrow (B=66) = scroll down
    LDI r6, 66
    CMP r4, r6
    JZ r1, scroll_down

    ; ESC (27) = quit
    LDI r6, 27
    CMP r4, r6
    JZ r1, help_quit

    JMP no_input

scroll_up:
    LDI r20, SCROLL
    LOAD r3, r20
    JZ r3, no_input
    LDI r6, 1
    SUB r3, r6
    STORE r20, r3
    JMP no_input

scroll_down:
    LDI r20, SCROLL
    LOAD r3, r20
    LDI r20, MAXSCRL
    LOAD r16, r20
    CMP r3, r16
    BGE r1, no_input
    LDI r20, SCROLL
    LOAD r3, r20
    LDI r6, 1
    ADD r3, r6
    STORE r20, r3
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
    LDI r7, 0x0D1B2A
    FILL r7

    ; Title bar
    LDI r7, 0
    LDI r5, 0
    LDI r15, 256
    LDI r11, 24
    LDI r12, 0x1B3A5C
    RECTF r7, r5, r15, r11, r12

    LDI r20, BUF
    STRO r20, "Geometry OS Help"
    LDI r7, 56
    LDI r5, 6
    LDI r15, BUF
    LDI r11, 0xFFFFFF
    LDI r12, 0x1B3A5C
    DRAWTEXT r7, r5, r15, r11, r12

    ; Content area background
    LDI r7, 8
    LDI r5, 28
    LDI r15, 240
    LDI r11, 216
    LDI r12, 0x101828
    RECTF r7, r5, r15, r11, r12

    ; Load scroll offset
    LDI r20, SCROLL
    LOAD r8, r20

    ; Draw help lines based on scroll offset
    ; Each line is 16px apart, starting at y=34
    ; We draw up to 13 visible lines

    ; Line 0 (relative to scroll)
    LDI r2, 0            ; line index
    LDI r9, 34           ; y position

help_line_loop:
    ; Check if we've drawn enough lines (13 visible)
    LDI r3, 13
    CMP r2, r3
    BGE r1, help_lines_done

    ; Compute which help entry to show: scroll_offset + line_index
    MOV r3, r8
    ADD r3, r2

    ; Dispatch on help entry index
    JZ r3, hl_keyboard
    LDI r6, 1
    CMP r3, r6
    JZ r1, hl_keys2
    LDI r6, 2
    CMP r3, r6
    JZ r1, hl_opcodes1
    LDI r6, 3
    CMP r3, r6
    JZ r1, hl_opcodes2
    LDI r6, 4
    CMP r3, r6
    JZ r1, hl_opcodes3
    LDI r6, 5
    CMP r3, r6
    JZ r1, hl_shell
    LDI r6, 6
    CMP r3, r6
    JZ r1, hl_memory
    LDI r6, 7
    CMP r3, r6
    JZ r1, hl_tips1
    LDI r6, 8
    CMP r3, r6
    JZ r1, hl_tips2
    LDI r6, 9
    CMP r3, r6
    JZ r1, hl_tips3
    LDI r6, 10
    CMP r3, r6
    JZ r1, hl_tips4
    LDI r6, 11
    CMP r3, r6
    JZ r1, hl_tips5
    LDI r6, 12
    CMP r3, r6
    JZ r1, hl_tips6
    JMP hl_blank

hl_keyboard:
    LDI r20, BUF
    STRO r20, "Keyboard Shortcuts"
    LDI r11, 0x8888FF
    JMP hl_draw

hl_keys2:
    LDI r20, BUF
    STRO r20, "F5=Run F8=Asm F6=Step ESC=Back"
    LDI r11, 0xAAAACC
    JMP hl_draw

hl_opcodes1:
    LDI r20, BUF
    STRO r20, "Opcodes (113 total)"
    LDI r11, 0x8888FF
    JMP hl_draw

hl_opcodes2:
    LDI r20, BUF
    STRO r20, "LDI LOAD STORE MOV ADD SUB MUL"
    LDI r11, 0xAAAACC
    JMP hl_draw

hl_opcodes3:
    LDI r20, BUF
    STRO r20, "DIV AND OR XOR SHL SHR MOD NEG"
    LDI r11, 0xAAAACC
    JMP hl_draw

hl_shell:
    LDI r20, BUF
    STRO r20, "Shell: help ls load run edit regs"
    LDI r11, 0xAAAACC
    JMP hl_draw

hl_memory:
    LDI r20, BUF
    STRO r20, "64K RAM  0x000-0x3FF=Source"
    LDI r11, 0xAAAACC
    JMP hl_draw

hl_tips1:
    LDI r20, BUF
    STRO r20, "Tips"
    LDI r11, 0x8888FF
    JMP hl_draw

hl_tips2:
    LDI r20, BUF
    STRO r20, "r1 reserved for CMP results"
    LDI r11, 0xAAAACC
    JMP hl_draw

hl_tips3:
    LDI r20, BUF
    STRO r20, "r30=SP r31=LR (CALL/RET)"
    LDI r11, 0xAAAACC
    JMP hl_draw

hl_tips4:
    LDI r20, BUF
    STRO r20, "No colons in .asm comments"
    LDI r11, 0xFF8888
    JMP hl_draw

hl_tips5:
    LDI r20, BUF
    STRO r20, "FRAME for animation loops"
    LDI r11, 0xAAAACC
    JMP hl_draw

hl_tips6:
    LDI r20, BUF
    STRO r20, "IKEY reads keyboard each frame"
    LDI r11, 0xAAAACC
    JMP hl_draw

hl_blank:
    LDI r20, BUF
    STRO r20, ""
    LDI r11, 0xAAAACC

hl_draw:
    LDI r7, 16
    MOV r5, r9
    LDI r15, BUF
    LDI r12, 0x101828
    DRAWTEXT r7, r5, r15, r11, r12

    ; Next line
    LDI r3, 1
    ADD r2, r3
    LDI r3, 16
    ADD r9, r3
    JMP help_line_loop

help_lines_done:
    ; Footer
    LDI r7, 0
    LDI r5, 244
    LDI r15, 256
    LDI r11, 12
    LDI r12, 0x0A0A1A
    RECTF r7, r5, r15, r11, r12

    LDI r20, BUF
    STRO r20, "Up/Down: Scroll  ESC: Back"
    LDI r7, 52
    LDI r5, 246
    LDI r15, BUF
    LDI r11, 0x6666AA
    LDI r12, 0x0A0A1A
    DRAWTEXT r7, r5, r15, r11, r12

    POP r31
    RET
