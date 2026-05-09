; DESCRIPTION: Places a orange circle of radius 63 at center (374, 130).
; PLAN: r0=374(x), r1=130(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 130
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
