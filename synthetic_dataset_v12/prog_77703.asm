; DESCRIPTION: Draws a red circle centered at (78, 117) with radius 14.
; PLAN: r0=78(x), r1=117(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 117
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
