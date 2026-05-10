; DESCRIPTION: Renders a orange disk with center (139, 132) and radius 80.
; PLAN: r0=139(x), r1=132(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 132
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
