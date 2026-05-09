; DESCRIPTION: Draws a orange circle centered at (393, 224) with radius 21.
; PLAN: r0=393(x), r1=224(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 224
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
