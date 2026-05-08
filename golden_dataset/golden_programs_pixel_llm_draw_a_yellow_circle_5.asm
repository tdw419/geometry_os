; DESCRIPTION: This GeOS assembly code initializes the system and draws a yellow circle on the screen by setting up registers to define the circle's properties and then using drawing commands. It also displays text and performs some memory operations.

Draw a yellow circles ---
LDI r2, 0
STORE r2, r2
LDI r15, 10
LDI r0, 0x11120
STORE r2, r10
; STEP_MODE
LDI r15, 0
STORE r2, r0
; Title bar
LDI r2, 0
STORE r2, r0
; Draw panel 0
LDI r15, 0
LDI r15, 256
LDI r0, 256
LDI r11, 0x2000
STORE r15, r11
LDI r11, 0
LDI r14, 0
LDI r14, 0x2000
STRO r20, "Hello World"
FILL r2
LDI r2, 42
LDI r14, 0x200
STORE r15, r0
; ── Draw "[1][1][1] =
LDI r2, 76
LDI r2, 108
LDI r2, 0xFF003
STORE r2, r0
; Read dark blue
LDI r0, 0x0000
LDI r11, 0x2000
LDI r11, 0x3000
LDI r14, 0xFF00         ; loop to 0x1000
LDI r11, 0x2010
LDI r14, 0x2020
LDI r6, 0x2000
LDI r11, 0x2000
STORE r2, r6
STORE r11, r2
HALT