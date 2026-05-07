; DESCRIPTION: This GeOS assembly code initializes the system and draws a yellow circle on the screen by setting up registers to define the circle's properties and then using drawing commands. It also displays text and performs some memory operations.

Draw a yellow circles ---
LDI r1, 0
STORE r1, r1
LDI r2, 10
LDI r3, 0x11120
STORE r1, r0
; STEP_MODE
LDI r2, 0
STORE r1, r3
; Title bar
LDI r1, 0
STORE r1, r3
; Draw panel 0
LDI r2, 0
LDI r2, 256
LDI r3, 256
LDI r4, 0x2000
STORE r2, r4
LDI r4, 0
LDI r5, 0
LDI r5, 0x2000
STRO r20, "Hello World"
FILL r1
LDI r1, 42
LDI r5, 0x200
STORE r2, r3
; ── Draw "[1][1][1] =
LDI r1, 76
LDI r1, 108
LDI r1, 0xFF003
STORE r1, r3
; Read dark blue
LDI r3, 0x0000
LDI r4, 0x2000
LDI r4, 0x3000
LDI r5, 0xFF00         ; loop to 0x1000
LDI r4, 0x2010
LDI r5, 0x2020
LDI r6, 0x2000
LDI r4, 0x2000
STORE r1, r6
STORE r4, r1
HALT