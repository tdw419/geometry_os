; DESCRIPTION: Draws a orange circle centered at (418, 130) with radius 30.
; PLAN: r0=418(x), r1=130(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 130
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
