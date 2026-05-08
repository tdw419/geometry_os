; DESCRIPTION: Render a yellow circle at the screen.

Draw a yellow circles ---
LDI r1, 0
STORE r1, r1
LDI r3, 10
LDI r0, 0x11120
STORE r1, r9
; STEP_MODE
LDI r3, 0
STORE r1, r0
; Title bar
LDI r1, 0
STORE r1, r0
; Draw panel 0
LDI r3, 0
LDI r3, 256
LDI r0, 256
LDI r7, 0x2000
STORE r3, r7
LDI r7, 0
LDI r14, 0
LDI r14, 0x2000
STRO r20, "Hello World"
FILL r1
LDI r1, 42
LDI r14, 0x200
STORE r3, r0
; ── Draw "[1][1][1] =
LDI r1, 76
LDI r1, 108
LDI r1, 0xFF003
STORE r1, r0
; Read dark blue
LDI r0, 0x0000
LDI r7, 0x2000
LDI r7, 0x3000
LDI r14, 0xFF00         ; loop to 0x1000
LDI r7, 0x2010
LDI r14, 0x2020
LDI r11, 0x2000
LDI r7, 0x2000
STORE r1, r11
STORE r7, r1
HALT