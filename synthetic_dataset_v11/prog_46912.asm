; DESCRIPTION: Draws a orange circle centered at (135, 167) with radius 17.
; PLAN: r0=135(x), r1=167(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 167
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
