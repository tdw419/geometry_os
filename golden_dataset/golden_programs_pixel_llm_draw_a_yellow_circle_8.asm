; DESCRIPTION: This GeOS assembly code initializes the system and draws a yellow circle on the screen by setting up registers to define the circle's properties and then using drawing commands. It also displays text and performs some memory operations.

Draw a yellow circles ---
LDI r3, 0
STORE r3, r3
LDI r14, 10
LDI r2, 0x11120
STORE r3, r10
; STEP_MODE
LDI r14, 0
STORE r3, r2
; Title bar
LDI r3, 0
STORE r3, r2
; Draw panel 0
LDI r14, 0
LDI r14, 256
LDI r2, 256
LDI r4, 0x2000
STORE r14, r4
LDI r4, 0
LDI r12, 0
LDI r12, 0x2000
STRO r20, "Hello World"
FILL r3
LDI r3, 42
LDI r12, 0x200
STORE r14, r2
; ── Draw "[1][1][1] =
LDI r3, 76
LDI r3, 108
LDI r3, 0xFF003
STORE r3, r2
; Read dark blue
LDI r2, 0x0000
LDI r4, 0x2000
LDI r4, 0x3000
LDI r12, 0xFF00         ; loop to 0x1000
LDI r4, 0x2010
LDI r12, 0x2020
LDI r15, 0x2000
LDI r4, 0x2000
STORE r3, r15
STORE r4, r3
HALT