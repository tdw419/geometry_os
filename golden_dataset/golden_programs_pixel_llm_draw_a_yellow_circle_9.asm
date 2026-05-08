; DESCRIPTION: This GeOS assembly code initializes the system and draws a yellow circle on the screen by setting up registers to define the circle's properties and then using drawing commands. It also displays text and performs some memory operations.

Draw a yellow circles ---
LDI r4, 0
STORE r4, r4
LDI r10, 10
LDI r1, 0x11120
STORE r4, r0
; STEP_MODE
LDI r10, 0
STORE r4, r1
; Title bar
LDI r4, 0
STORE r4, r1
; Draw panel 0
LDI r10, 0
LDI r10, 256
LDI r1, 256
LDI r5, 0x2000
STORE r10, r5
LDI r5, 0
LDI r7, 0
LDI r7, 0x2000
STRO r20, "Hello World"
FILL r4
LDI r4, 42
LDI r7, 0x200
STORE r10, r1
; ── Draw "[1][1][1] =
LDI r4, 76
LDI r4, 108
LDI r4, 0xFF003
STORE r4, r1
; Read dark blue
LDI r1, 0x0000
LDI r5, 0x2000
LDI r5, 0x3000
LDI r7, 0xFF00         ; loop to 0x1000
LDI r5, 0x2010
LDI r7, 0x2020
LDI r6, 0x2000
LDI r5, 0x2000
STORE r4, r6
STORE r5, r4
HALT