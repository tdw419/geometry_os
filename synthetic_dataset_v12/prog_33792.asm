; DESCRIPTION: Draws a red circle centered at (100, 91) with radius 52.
; PLAN: r0=100(x), r1=91(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 91
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
