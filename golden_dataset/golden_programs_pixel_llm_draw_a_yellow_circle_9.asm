; DESCRIPTION: Draws a yellow circle at the screen with fixed size.

Draw a yellow circles ---
LDI r2, 0
STORE r2, r2
LDI r8, 10
LDI r13, 0x11120
STORE r2, r4
; STEP_MODE
LDI r8, 0
STORE r2, r13
; Title bar
LDI r2, 0
STORE r2, r13
; Draw panel 0
LDI r8, 0
LDI r8, 256
LDI r13, 256
LDI r0, 0x2000
STORE r8, r0
LDI r0, 0
LDI r7, 0
LDI r7, 0x2000
STRO r20, "Hello World"
FILL r2
LDI r2, 42
LDI r7, 0x200
STORE r8, r13
; ── Draw "[1][1][1] =
LDI r2, 76
LDI r2, 108
LDI r2, 0xFF003
STORE r2, r13
; Read dark blue
LDI r13, 0x0000
LDI r0, 0x2000
LDI r0, 0x3000
LDI r7, 0xFF00         ; loop to 0x1000
LDI r0, 0x2010
LDI r7, 0x2020
LDI r12, 0x2000
LDI r0, 0x2000
STORE r2, r12
STORE r0, r2
HALT