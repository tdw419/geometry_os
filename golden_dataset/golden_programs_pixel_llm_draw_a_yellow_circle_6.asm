; DESCRIPTION: Geometry OS program to draw a yellow circle.

Draw a yellow circles ---
LDI r15, 0
STORE r15, r15
LDI r7, 10
LDI r8, 0x11120
STORE r15, r3
; STEP_MODE
LDI r7, 0
STORE r15, r8
; Title bar
LDI r15, 0
STORE r15, r8
; Draw panel 0
LDI r7, 0
LDI r7, 256
LDI r8, 256
LDI r2, 0x2000
STORE r7, r2
LDI r2, 0
LDI r0, 0
LDI r0, 0x2000
STRO r20, "Hello World"
FILL r15
LDI r15, 42
LDI r0, 0x200
STORE r7, r8
; ── Draw "[1][1][1] =
LDI r15, 76
LDI r15, 108
LDI r15, 0xFF003
STORE r15, r8
; Read dark blue
LDI r8, 0x0000
LDI r2, 0x2000
LDI r2, 0x3000
LDI r0, 0xFF00         ; loop to 0x1000
LDI r2, 0x2010
LDI r0, 0x2020
LDI r5, 0x2000
LDI r2, 0x2000
STORE r15, r5
STORE r2, r15
HALT