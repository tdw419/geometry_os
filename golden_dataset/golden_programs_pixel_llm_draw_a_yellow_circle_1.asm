; DESCRIPTION: This GeOS assembly code initializes the system and draws a yellow circle on the screen by setting up registers to define the circle's properties and then using drawing commands. It also displays text and performs some memory operations.

Draw a yellow circles ---
LDI r5, 0
STORE r5, r5
LDI r6, 10
LDI r15, 0x11120
STORE r5, r10
; STEP_MODE
LDI r6, 0
STORE r5, r15
; Title bar
LDI r5, 0
STORE r5, r15
; Draw panel 0
LDI r6, 0
LDI r6, 256
LDI r15, 256
LDI r8, 0x2000
STORE r6, r8
LDI r8, 0
LDI r4, 0
LDI r4, 0x2000
STRO r20, "Hello World"
FILL r5
LDI r5, 42
LDI r4, 0x200
STORE r6, r15
; ── Draw "[1][1][1] =
LDI r5, 76
LDI r5, 108
LDI r5, 0xFF003
STORE r5, r15
; Read dark blue
LDI r15, 0x0000
LDI r8, 0x2000
LDI r8, 0x3000
LDI r4, 0xFF00         ; loop to 0x1000
LDI r8, 0x2010
LDI r4, 0x2020
LDI r0, 0x2000
LDI r8, 0x2000
STORE r5, r0
STORE r8, r5
HALT