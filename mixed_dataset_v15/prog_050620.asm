; DESCRIPTION: Draws a orange circle centered at (50, 237) with radius 19.
; PLAN: r0=50(x), r1=237(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 237
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
