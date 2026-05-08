; DESCRIPTION: This GeOS assembly code initializes the system and draws a yellow circle on the screen by setting up registers to define the circle's properties and then using drawing commands. It also displays text and performs some memory operations.

Draw a yellow circles ---
LDI r2, 0
STORE r2, r2
LDI r9, 10
LDI r11, 0x11120
STORE r2, r1
; STEP_MODE
LDI r9, 0
STORE r2, r11
; Title bar
LDI r2, 0
STORE r2, r11
; Draw panel 0
LDI r9, 0
LDI r9, 256
LDI r11, 256
LDI r6, 0x2000
STORE r9, r6
LDI r6, 0
LDI r8, 0
LDI r8, 0x2000
STRO r20, "Hello World"
FILL r2
LDI r2, 42
LDI r8, 0x200
STORE r9, r11
; ── Draw "[1][1][1] =
LDI r2, 76
LDI r2, 108
LDI r2, 0xFF003
STORE r2, r11
; Read dark blue
LDI r11, 0x0000
LDI r6, 0x2000
LDI r6, 0x3000
LDI r8, 0xFF00         ; loop to 0x1000
LDI r6, 0x2010
LDI r8, 0x2020
LDI r15, 0x2000
LDI r6, 0x2000
STORE r2, r15
STORE r6, r2
HALT