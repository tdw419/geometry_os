; DESCRIPTION: Draws a red circle centered at (172, 40) with radius 23.
; PLAN: r0=172(x), r1=40(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 40
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
