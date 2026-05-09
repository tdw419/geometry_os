; DESCRIPTION: Draws a orange circle centered at (438, 139) with radius 21.
; PLAN: r0=438(x), r1=139(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 139
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
