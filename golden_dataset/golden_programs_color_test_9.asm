; DESCRIPTION: The code initializes the screen to a dark gray color and writes several rows of text in different ANSI colors (red, green, blue, yellow, cyan) directly to memory buffers at specified addresses. It also fills corresponding color buffers with the respective color codes for each text row.

; color_test.asm -- Test ANSI SGR color rendering
; Writes text in various ANSI colors to verify color buffer works

LDI r6, 1
LDI r30, 0xFD00

; Fill screen dark
LDI r14, 0x0A0A0A
FILL r14

; Simulate what host_term.asm does:
; Write text directly to BUF (0x4000) and colors to COLOR_BUF (0x7800)

; Row 0: "ANSI Color Test" in default gray
LDI r20, 0x4000
STRO r20, "ANSI Color Test"

; Row 1: Red text
LDI r20, 0x4050
STRO r20, "Red text here"
LDI r15, 0x4050
LDI r1, 0x7850
LDI r10, 13
LDI r7, 0xCD0000
call_fill_red:
    STORE r1, r7
    ADD r15, r6
    ADD r1, r6
    SUB r10, r6
    CMPI r10, 0
    JNZ r14, call_fill_red

; Row 2: Green text
LDI r20, 0x40A0
STRO r20, "Green text here"
LDI r15, 0x40A0
LDI r1, 0x78A0
LDI r10, 15
LDI r7, 0x00CD00
call_fill_green:
    STORE r1, r7
    ADD r15, r6
    ADD r1, r6
    SUB r10, r6
    CMPI r10, 0
    JNZ r14, call_fill_green

; Row 3: Blue text
LDI r20, 0x40F0
STRO r20, "Blue text here"
LDI r15, 0x40F0
LDI r1, 0x78F0
LDI r10, 14
LDI r7, 0x0000EE
call_fill_blue:
    STORE r1, r7
    ADD r15, r6
    ADD r1, r6
    SUB r10, r6
    CMPI r10, 0
    JNZ r14, call_fill_blue

; Row 4: Yellow text
LDI r20, 0x4140
STRO r20, "Yellow text here"
LDI r15, 0x4140
LDI r1, 0x7940
LDI r10, 16
LDI r7, 0xCDCD00
call_fill_yellow:
    STORE r1, r7
    ADD r15, r6
    ADD r1, r6
    SUB r10, r6
    CMPI r10, 0
    JNZ r14, call_fill_yellow

; Row 5: Cyan text
LDI r20, 0x4190
STRO r20, "Cyan text here"
LDI r15, 0x4190
LDI r1, 0x7990
LDI r10, 14
LDI r7, 0x00CDCD
call_fill_cyan:
    STORE r1, r7
    ADD r15, r6
    ADD r1, r6
    SUB r10, r6
    CMPI r10, 0
    JNZ r14, call_fill_cyan

HALT
