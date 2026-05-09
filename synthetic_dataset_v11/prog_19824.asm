; DESCRIPTION: Draws a red circle centered at (213, 123) with radius 31.
; PLAN: r0=213(x), r1=123(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 123
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
