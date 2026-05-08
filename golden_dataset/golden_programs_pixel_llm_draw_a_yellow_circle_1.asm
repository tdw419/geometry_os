; DESCRIPTION: Render a yellow circle at the screen.

Draw a yellow circles ---
LDI r15, 0
STORE r15, r15
LDI r14, 10
LDI r5, 0x11120
STORE r15, r8
; STEP_MODE
LDI r14, 0
STORE r15, r5
; Title bar
LDI r15, 0
STORE r15, r5
; Draw panel 0
LDI r14, 0
LDI r14, 256
LDI r5, 256
LDI r10, 0x2000
STORE r14, r10
LDI r10, 0
LDI r11, 0
LDI r11, 0x2000
STRO r20, "Hello World"
FILL r15
LDI r15, 42
LDI r11, 0x200
STORE r14, r5
; ── Draw "[1][1][1] =
LDI r15, 76
LDI r15, 108
LDI r15, 0xFF003
STORE r15, r5
; Read dark blue
LDI r5, 0x0000
LDI r10, 0x2000
LDI r10, 0x3000
LDI r11, 0xFF00         ; loop to 0x1000
LDI r10, 0x2010
LDI r11, 0x2020
LDI r4, 0x2000
LDI r10, 0x2000
STORE r15, r4
STORE r10, r15
HALT