; DESCRIPTION: This GeOS assembly code initializes the system and draws a yellow circle on the screen by setting up registers to define the circle's properties and then using drawing commands. It also displays text and performs some memory operations.

Draw a yellow circles ---
LDI r4, 0
STORE r4, r4
LDI r14, 10
LDI r11, 0x11120
STORE r4, r2
; STEP_MODE
LDI r14, 0
STORE r4, r11
; Title bar
LDI r4, 0
STORE r4, r11
; Draw panel 0
LDI r14, 0
LDI r14, 256
LDI r11, 256
LDI r7, 0x2000
STORE r14, r7
LDI r7, 0
LDI r15, 0
LDI r15, 0x2000
STRO r20, "Hello World"
FILL r4
LDI r4, 42
LDI r15, 0x200
STORE r14, r11
; ── Draw "[1][1][1] =
LDI r4, 76
LDI r4, 108
LDI r4, 0xFF003
STORE r4, r11
; Read dark blue
LDI r11, 0x0000
LDI r7, 0x2000
LDI r7, 0x3000
LDI r15, 0xFF00         ; loop to 0x1000
LDI r7, 0x2010
LDI r15, 0x2020
LDI r8, 0x2000
LDI r7, 0x2000
STORE r4, r8
STORE r7, r4
HALT