; DESCRIPTION: Draw circle: pos=the screen, color=yellow, size=fixed size.

Draw a yellow circles ---
LDI r6, 0
STORE r6, r6
LDI r2, 10
LDI r9, 0x11120
STORE r6, r8
; STEP_MODE
LDI r2, 0
STORE r6, r9
; Title bar
LDI r6, 0
STORE r6, r9
; Draw panel 0
LDI r2, 0
LDI r2, 256
LDI r9, 256
LDI r1, 0x2000
STORE r2, r1
LDI r1, 0
LDI r10, 0
LDI r10, 0x2000
STRO r20, "Hello World"
FILL r6
LDI r6, 42
LDI r10, 0x200
STORE r2, r9
; ── Draw "[1][1][1] =
LDI r6, 76
LDI r6, 108
LDI r6, 0xFF003
STORE r6, r9
; Read dark blue
LDI r9, 0x0000
LDI r1, 0x2000
LDI r1, 0x3000
LDI r10, 0xFF00         ; loop to 0x1000
LDI r1, 0x2010
LDI r10, 0x2020
LDI r3, 0x2000
LDI r1, 0x2000
STORE r6, r3
STORE r1, r6
HALT