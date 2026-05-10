; DESCRIPTION: Draws a red circle centered at (357, 176) with radius 17.
; PLAN: r0=357(x), r1=176(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 176
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
