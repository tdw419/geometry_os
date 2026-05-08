; DESCRIPTION: This GeOS assembly code initializes the system and draws a yellow circle on the screen by setting up registers to define the circle's properties and then using drawing commands. It also displays text and performs some memory operations.

Draw a yellow circles ---
LDI r7, 0
STORE r7, r7
LDI r9, 10
LDI r8, 0x11120
STORE r7, r11
; STEP_MODE
LDI r9, 0
STORE r7, r8
; Title bar
LDI r7, 0
STORE r7, r8
; Draw panel 0
LDI r9, 0
LDI r9, 256
LDI r8, 256
LDI r0, 0x2000
STORE r9, r0
LDI r0, 0
LDI r13, 0
LDI r13, 0x2000
STRO r20, "Hello World"
FILL r7
LDI r7, 42
LDI r13, 0x200
STORE r9, r8
; ── Draw "[1][1][1] =
LDI r7, 76
LDI r7, 108
LDI r7, 0xFF003
STORE r7, r8
; Read dark blue
LDI r8, 0x0000
LDI r0, 0x2000
LDI r0, 0x3000
LDI r13, 0xFF00         ; loop to 0x1000
LDI r0, 0x2010
LDI r13, 0x2020
LDI r2, 0x2000
LDI r0, 0x2000
STORE r7, r2
STORE r0, r7
HALT