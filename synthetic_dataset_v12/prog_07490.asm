; DESCRIPTION: Renders a orange disk with center (333, 110) and radius 11.
; PLAN: r0=333(x), r1=110(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 110
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
