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
LDI r14, 1

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
    LDI r6, 65
    CMP r7, r6
    JZ r0, scroll_up

    ; Down arrow (B=66) = scroll down
    LDI r6, 66
    CMP r7, r6
    JZ r0, scroll_down

    ; ESC (27) = quit
    LDI r6, 27
    CMP r7, r6
    JZ r0, help_quit

    JMP no_input

scroll_up:
    LDI r20, SCROLL
    LOAD r11, r20
    JZ r11, no_input
    LDI r6, 1
    SUB r11, r6
    STORE r20, r11
    JMP no_input

scroll_down:
    LDI r20, SCROLL
    LOAD r11, r20
    LDI r20, MAXSCRL
    LOAD r16, r20
    CMP r11, r16
    BGE r0, no_input
    LDI r20, SCROLL
    LOAD r11, r20
    LDI r6, 1
    ADD r11, r6
    STORE r20, r11
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
    LDI r14, 0x0D1B2A
    FILL r14

    ; Title bar
    LDI r14, 0
    LDI r5, 0
    LDI r9, 256
    LDI r12, 24
    LDI r13, 0x1B3A5C
    RECTF r14, r5, r9, r12, r13

    LDI r20, BUF
    STRO r20, "Geometry OS Help"
    LDI r14, 56
    LDI r5, 6
    LDI r9, BUF
    LDI r12, 0xFFFFFF
    LDI r13, 0x1B3A5C
    DRAWTEXT r14, r5, r9, r12, r13

    ; Content area background
    LDI r14, 8
    LDI r5, 28
    LDI r9, 240
    LDI r12, 216
    LDI r13, 0x101828
    RECTF r14, r5, r9, r12, r13

    ; Load scroll offset
    LDI r20, SCROLL
    LOAD r3, r20

    ; Draw help lines based on scroll offset
    ; Each line is 16px apart, starting at y=34
    ; We draw up to 13 visible lines

    ; Line 0 (relative to scroll)
    LDI r1, 0            ; line index
    LDI r8, 34           ; y position

help_line_loop:
    ; Check if we've drawn enough lines (13 visible)
    LDI r11, 13
    CMP r1, r11
    BGE r0, help_lines_done

    ; Compute which help entry to show: scroll_offset + line_index
    MOV r11, r3
    ADD r11, r1

    ; Dispatch on help entry index
    JZ r11, hl_keyboard
    LDI r6, 1
    CMP r11, r6
    JZ r0, hl_keys2
    LDI r6, 2
    CMP r11, r6
    JZ r0, hl_opcodes1
    LDI r6, 3
    CMP r11, r6
    JZ r0, hl_opcodes2
    LDI r6, 4
    CMP r11, r6
    JZ r0, hl_opcodes3
    LDI r6, 5
    CMP r11, r6
    JZ r0, hl_shell
    LDI r6, 6
    CMP r11, r6
    JZ r0, hl_memory
    LDI r6, 7
    CMP r11, r6
    JZ r0, hl_tips1
    LDI r6, 8
    CMP r11, r6
    JZ r0, hl_tips2
    LDI r6, 9
    CMP r11, r6
    JZ r0, hl_tips3
    LDI r6, 10
    CMP r11, r6
    JZ r0, hl_tips4
    LDI r6, 11
    CMP r11, r6
    JZ r0, hl_tips5
    LDI r6, 12
    CMP r11, r6
    JZ r0, hl_tips6
    JMP hl_blank

hl_keyboard:
    LDI r20, BUF
    STRO r20, "Keyboard Shortcuts"
    LDI r12, 0x8888FF
    JMP hl_draw

hl_keys2:
    LDI r20, BUF
    STRO r20, "F5=Run F8=Asm F6=Step ESC=Back"
    LDI r12, 0xAAAACC
    JMP hl_draw

hl_opcodes1:
    LDI r20, BUF
    STRO r20, "Opcodes (113 total)"
    LDI r12, 0x8888FF
    JMP hl_draw

hl_opcodes2:
    LDI r20, BUF
    STRO r20, "LDI LOAD STORE MOV ADD SUB MUL"
    LDI r12, 0xAAAACC
    JMP hl_draw

hl_opcodes3:
    LDI r20, BUF
    STRO r20, "DIV AND OR XOR SHL SHR MOD NEG"
    LDI r12, 0xAAAACC
    JMP hl_draw

hl_shell:
    LDI r20, BUF
    STRO r20, "Shell: help ls load run edit regs"
    LDI r12, 0xAAAACC
    JMP hl_draw

hl_memory:
    LDI r20, BUF
    STRO r20, "64K RAM  0x000-0x3FF=Source"
    LDI r12, 0xAAAACC
    JMP hl_draw

hl_tips1:
    LDI r20, BUF
    STRO r20, "Tips"
    LDI r12, 0x8888FF
    JMP hl_draw

hl_tips2:
    LDI r20, BUF
    STRO r20, "r0 reserved for CMP results"
    LDI r12, 0xAAAACC
    JMP hl_draw

hl_tips3:
    LDI r20, BUF
    STRO r20, "r30=SP r31=LR (CALL/RET)"
    LDI r12, 0xAAAACC
    JMP hl_draw

hl_tips4:
    LDI r20, BUF
    STRO r20, "No colons in .asm comments"
    LDI r12, 0xFF8888
    JMP hl_draw

hl_tips5:
    LDI r20, BUF
    STRO r20, "FRAME for animation loops"
    LDI r12, 0xAAAACC
    JMP hl_draw

hl_tips6:
    LDI r20, BUF
    STRO r20, "IKEY reads keyboard each frame"
    LDI r12, 0xAAAACC
    JMP hl_draw

hl_blank:
    LDI r20, BUF
    STRO r20, ""
    LDI r12, 0xAAAACC

hl_draw:
    LDI r14, 16
    MOV r5, r8
    LDI r9, BUF
    LDI r13, 0x101828
    DRAWTEXT r14, r5, r9, r12, r13

    ; Next line
    LDI r11, 1
    ADD r1, r11
    LDI r11, 16
    ADD r8, r11
    JMP help_line_loop

help_lines_done:
    ; Footer
    LDI r14, 0
    LDI r5, 244
    LDI r9, 256
    LDI r12, 12
    LDI r13, 0x0A0A1A
    RECTF r14, r5, r9, r12, r13

    LDI r20, BUF
    STRO r20, "Up/Down: Scroll  ESC: Back"
    LDI r14, 52
    LDI r5, 246
    LDI r9, BUF
    LDI r12, 0x6666AA
    LDI r13, 0x0A0A1A
    DRAWTEXT r14, r5, r9, r12, r13

    POP r31
    RET
