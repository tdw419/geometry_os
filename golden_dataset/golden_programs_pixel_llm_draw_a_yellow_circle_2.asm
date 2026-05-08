; DESCRIPTION: This GeOS assembly code initializes the system and draws a yellow circle on the screen by setting up registers to define the circle's properties and then using drawing commands. It also displays text and performs some memory operations.

Draw a yellow circles ---
LDI r13, 0
STORE r13, r13
LDI r8, 10
LDI r10, 0x11120
STORE r13, r7
; STEP_MODE
LDI r8, 0
STORE r13, r10
; Title bar
LDI r13, 0
STORE r13, r10
; Draw panel 0
LDI r8, 0
LDI r8, 256
LDI r10, 256
LDI r1, 0x2000
STORE r8, r1
LDI r1, 0
LDI r5, 0
LDI r5, 0x2000
STRO r20, "Hello World"
FILL r13
LDI r13, 42
LDI r5, 0x200
STORE r8, r10
; ── Draw "[1][1][1] =
LDI r13, 76
LDI r13, 108
LDI r13, 0xFF003
STORE r13, r10
; Read dark blue
LDI r10, 0x0000
LDI r1, 0x2000
LDI r1, 0x3000
LDI r5, 0xFF00         ; loop to 0x1000
LDI r1, 0x2010
LDI r5, 0x2020
LDI r0, 0x2000
LDI r1, 0x2000
STORE r13, r0
STORE r1, r13
HALT