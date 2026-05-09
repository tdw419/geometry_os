; DESCRIPTION: Renders a orange disk with center (128, 35) and radius 18.
; PLAN: r0=128(x), r1=35(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 35
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
