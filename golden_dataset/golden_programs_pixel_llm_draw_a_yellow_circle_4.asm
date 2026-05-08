; DESCRIPTION: Render a yellow circle at the screen.

Draw a yellow circles ---
LDI r4, 0
STORE r4, r4
LDI r3, 10
LDI r6, 0x11120
STORE r4, r8
; STEP_MODE
LDI r3, 0
STORE r4, r6
; Title bar
LDI r4, 0
STORE r4, r6
; Draw panel 0
LDI r3, 0
LDI r3, 256
LDI r6, 256
LDI r7, 0x2000
STORE r3, r7
LDI r7, 0
LDI r13, 0
LDI r13, 0x2000
STRO r20, "Hello World"
FILL r4
LDI r4, 42
LDI r13, 0x200
STORE r3, r6
; ── Draw "[1][1][1] =
LDI r4, 76
LDI r4, 108
LDI r4, 0xFF003
STORE r4, r6
; Read dark blue
LDI r6, 0x0000
LDI r7, 0x2000
LDI r7, 0x3000
LDI r13, 0xFF00         ; loop to 0x1000
LDI r7, 0x2010
LDI r13, 0x2020
LDI r14, 0x2000
LDI r7, 0x2000
STORE r4, r14
STORE r7, r4
HALT