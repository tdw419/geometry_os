; DESCRIPTION: Renders a orange disk with center (98, 160) and radius 15.
; PLAN: r0=98(x), r1=160(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 160
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
