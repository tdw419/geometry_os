; DESCRIPTION: Draws a orange circle centered at (302, 107) with radius 17.
; PLAN: r0=302(x), r1=107(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 107
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
