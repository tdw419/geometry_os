; DESCRIPTION: A yellow circle centered at the screen with fixed size.

Draw a yellow circles ---
LDI r11, 0
STORE r11, r11
LDI r9, 10
LDI r8, 0x11120
STORE r11, r14
; STEP_MODE
LDI r9, 0
STORE r11, r8
; Title bar
LDI r11, 0
STORE r11, r8
; Draw panel 0
LDI r9, 0
LDI r9, 256
LDI r8, 256
LDI r13, 0x2000
STORE r9, r13
LDI r13, 0
LDI r5, 0
LDI r5, 0x2000
STRO r20, "Hello World"
FILL r11
LDI r11, 42
LDI r5, 0x200
STORE r9, r8
; ── Draw "[1][1][1] =
LDI r11, 76
LDI r11, 108
LDI r11, 0xFF003
STORE r11, r8
; Read dark blue
LDI r8, 0x0000
LDI r13, 0x2000
LDI r13, 0x3000
LDI r5, 0xFF00         ; loop to 0x1000
LDI r13, 0x2010
LDI r5, 0x2020
LDI r4, 0x2000
LDI r13, 0x2000
STORE r11, r4
STORE r13, r11
HALT