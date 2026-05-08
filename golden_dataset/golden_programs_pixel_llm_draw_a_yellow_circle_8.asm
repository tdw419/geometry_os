; DESCRIPTION: Render a yellow circle at the screen.

Draw a yellow circles ---
LDI r7, 0
STORE r7, r7
LDI r12, 10
LDI r0, 0x11120
STORE r7, r4
; STEP_MODE
LDI r12, 0
STORE r7, r0
; Title bar
LDI r7, 0
STORE r7, r0
; Draw panel 0
LDI r12, 0
LDI r12, 256
LDI r0, 256
LDI r15, 0x2000
STORE r12, r15
LDI r15, 0
LDI r5, 0
LDI r5, 0x2000
STRO r20, "Hello World"
FILL r7
LDI r7, 42
LDI r5, 0x200
STORE r12, r0
; ── Draw "[1][1][1] =
LDI r7, 76
LDI r7, 108
LDI r7, 0xFF003
STORE r7, r0
; Read dark blue
LDI r0, 0x0000
LDI r15, 0x2000
LDI r15, 0x3000
LDI r5, 0xFF00         ; loop to 0x1000
LDI r15, 0x2010
LDI r5, 0x2020
LDI r8, 0x2000
LDI r15, 0x2000
STORE r7, r8
STORE r15, r7
HALT