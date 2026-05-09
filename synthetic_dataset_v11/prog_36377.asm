; DESCRIPTION: Draws a orange circle centered at (237, 185) with radius 10.
; PLAN: r0=237(x), r1=185(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 185
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
