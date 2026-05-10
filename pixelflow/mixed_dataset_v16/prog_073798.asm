; DESCRIPTION: Draws a orange circle centered at (163, 177) with radius 46.
; PLAN: r0=163(x), r1=177(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 177
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
