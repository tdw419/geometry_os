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
    IKEY r15
    JZ r15, no_input

    ; Up arrow (A=65) = scroll up
    LDI r7, 65
    CMP r15, r7
    JZ r14, scroll_up

    ; Down arrow (B=66) = scroll down
    LDI r7, 66
    CMP r15, r7
    JZ r14, scroll_down

    ; ESC (27) = quit
    LDI r7, 27
    CMP r15, r7
    JZ r14, help_quit

    JMP no_input

scroll_up:
    LDI r20, SCROLL
    LOAD r2, r20
    JZ r2, no_input
    LDI r7, 1
    SUB r2, r7
    STORE r20, r2
    JMP no_input

scroll_down:
    LDI r20, SCROLL
    LOAD r2, r20
    LDI r20, MAXSCRL
    LOAD r16, r20
    CMP r2, r16
    BGE r14, no_input
    LDI r20, SCROLL
    LOAD r2, r20
    LDI r7, 1
    ADD r2, r7
    STORE r20, r2
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
    LDI r11, 0
    LDI r12, 256
    LDI r5, 24
    LDI r0, 0x1B3A5C
    RECTF r3, r11, r12, r5, r0

    LDI r20, BUF
    STRO r20, "Geometry OS Help"
    LDI r3, 56
    LDI r11, 6
    LDI r12, BUF
    LDI r5, 0xFFFFFF
    LDI r0, 0x1B3A5C
    DRAWTEXT r3, r11, r12, r5, r0

    ; Content area background
    LDI r3, 8
    LDI r11, 28
    LDI r12, 240
    LDI r5, 216
    LDI r0, 0x101828
    RECTF r3, r11, r12, r5, r0

    ; Load scroll offset
    LDI r20, SCROLL
    LOAD r10, r20

    ; Draw help lines based on scroll offset
    ; Each line is 16px apart, starting at y=34
    ; We draw up to 13 visible lines

    ; Line 0 (relative to scroll)
    LDI r9, 0            ; line index
    LDI r1, 34           ; y position

help_line_loop:
    ; Check if we've drawn enough lines (13 visible)
    LDI r2, 13
    CMP r9, r2
    BGE r14, help_lines_done

    ; Compute which help entry to show: scroll_offset + line_index
    MOV r2, r10
    ADD r2, r9

    ; Dispatch on help entry index
    JZ r2, hl_keyboard
    LDI r7, 1
    CMP r2, r7
    JZ r14, hl_keys2
    LDI r7, 2
    CMP r2, r7
    JZ r14, hl_opcodes1
    LDI r7, 3
    CMP r2, r7
    JZ r14, hl_opcodes2
    LDI r7, 4
    CMP r2, r7
    JZ r14, hl_opcodes3
    LDI r7, 5
    CMP r2, r7
    JZ r14, hl_shell
    LDI r7, 6
    CMP r2, r7
    JZ r14, hl_memory
    LDI r7, 7
    CMP r2, r7
    JZ r14, hl_tips1
    LDI r7, 8
    CMP r2, r7
    JZ r14, hl_tips2
    LDI r7, 9
    CMP r2, r7
    JZ r14, hl_tips3
    LDI r7, 10
    CMP r2, r7
    JZ r14, hl_tips4
    LDI r7, 11
    CMP r2, r7
    JZ r14, hl_tips5
    LDI r7, 12
    CMP r2, r7
    JZ r14, hl_tips6
    JMP hl_blank

hl_keyboard:
    LDI r20, BUF
    STRO r20, "Keyboard Shortcuts"
    LDI r5, 0x8888FF
    JMP hl_draw

hl_keys2:
    LDI r20, BUF
    STRO r20, "F5=Run F8=Asm F6=Step ESC=Back"
    LDI r5, 0xAAAACC
    JMP hl_draw

hl_opcodes1:
    LDI r20, BUF
    STRO r20, "Opcodes (113 total)"
    LDI r5, 0x8888FF
    JMP hl_draw

hl_opcodes2:
    LDI r20, BUF
    STRO r20, "LDI LOAD STORE MOV ADD SUB MUL"
    LDI r5, 0xAAAACC
    JMP hl_draw

hl_opcodes3:
    LDI r20, BUF
    STRO r20, "DIV AND OR XOR SHL SHR MOD NEG"
    LDI r5, 0xAAAACC
    JMP hl_draw

hl_shell:
    LDI r20, BUF
    STRO r20, "Shell: help ls load run edit regs"
    LDI r5, 0xAAAACC
    JMP hl_draw

hl_memory:
    LDI r20, BUF
    STRO r20, "64K RAM  0x000-0x3FF=Source"
    LDI r5, 0xAAAACC
    JMP hl_draw

hl_tips1:
    LDI r20, BUF
    STRO r20, "Tips"
    LDI r5, 0x8888FF
    JMP hl_draw

hl_tips2:
    LDI r20, BUF
    STRO r20, "r14 reserved for CMP results"
    LDI r5, 0xAAAACC
    JMP hl_draw

hl_tips3:
    LDI r20, BUF
    STRO r20, "r30=SP r31=LR (CALL/RET)"
    LDI r5, 0xAAAACC
    JMP hl_draw

hl_tips4:
    LDI r20, BUF
    STRO r20, "No colons in .asm comments"
    LDI r5, 0xFF8888
    JMP hl_draw

hl_tips5:
    LDI r20, BUF
    STRO r20, "FRAME for animation loops"
    LDI r5, 0xAAAACC
    JMP hl_draw

hl_tips6:
    LDI r20, BUF
    STRO r20, "IKEY reads keyboard each frame"
    LDI r5, 0xAAAACC
    JMP hl_draw

hl_blank:
    LDI r20, BUF
    STRO r20, ""
    LDI r5, 0xAAAACC

hl_draw:
    LDI r3, 16
    MOV r11, r1
    LDI r12, BUF
    LDI r0, 0x101828
    DRAWTEXT r3, r11, r12, r5, r0

    ; Next line
    LDI r2, 1
    ADD r9, r2
    LDI r2, 16
    ADD r1, r2
    JMP help_line_loop

help_lines_done:
    ; Footer
    LDI r3, 0
    LDI r11, 244
    LDI r12, 256
    LDI r5, 12
    LDI r0, 0x0A0A1A
    RECTF r3, r11, r12, r5, r0

    LDI r20, BUF
    STRO r20, "Up/Down: Scroll  ESC: Back"
    LDI r3, 52
    LDI r11, 246
    LDI r12, BUF
    LDI r5, 0x6666AA
    LDI r0, 0x0A0A1A
    DRAWTEXT r3, r11, r12, r5, r0

    POP r31
    RET
