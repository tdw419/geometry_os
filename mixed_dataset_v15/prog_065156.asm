; DESCRIPTION: Draws a red circle centered at (223, 179) with radius 59.
; PLAN: r0=223(x), r1=179(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 179
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
