; DESCRIPTION: Draws a red circle centered at (106, 162) with radius 64.
; PLAN: r0=106(x), r1=162(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 162
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
