; DESCRIPTION: Draws a orange circle centered at (172, 187) with radius 40.
; PLAN: r0=172(x), r1=187(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 187
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
