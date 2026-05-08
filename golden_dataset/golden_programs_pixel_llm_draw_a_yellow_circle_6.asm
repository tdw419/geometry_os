; DESCRIPTION: This GeOS assembly code initializes the system and draws a yellow circle on the screen by setting up registers to define the circle's properties and then using drawing commands. It also displays text and performs some memory operations.

Draw a yellow circles ---
LDI r8, 0
STORE r8, r8
LDI r0, 10
LDI r12, 0x11120
STORE r8, r15
; STEP_MODE
LDI r0, 0
STORE r8, r12
; Title bar
LDI r8, 0
STORE r8, r12
; Draw panel 0
LDI r0, 0
LDI r0, 256
LDI r12, 256
LDI r14, 0x2000
STORE r0, r14
LDI r14, 0
LDI r6, 0
LDI r6, 0x2000
STRO r20, "Hello World"
FILL r8
LDI r8, 42
LDI r6, 0x200
STORE r0, r12
; ── Draw "[1][1][1] =
LDI r8, 76
LDI r8, 108
LDI r8, 0xFF003
STORE r8, r12
; Read dark blue
LDI r12, 0x0000
LDI r14, 0x2000
LDI r14, 0x3000
LDI r6, 0xFF00         ; loop to 0x1000
LDI r14, 0x2010
LDI r6, 0x2020
LDI r10, 0x2000
LDI r14, 0x2000
STORE r8, r10
STORE r14, r8
HALT