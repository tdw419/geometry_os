; DESCRIPTION: Renders a orange disk with center (170, 32) and radius 13.
; PLAN: r0=170(x), r1=32(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 32
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
