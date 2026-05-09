; DESCRIPTION: Draws a red circle centered at (99, 80) with radius 64.
; PLAN: r0=99(x), r1=80(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 80
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
