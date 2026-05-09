; DESCRIPTION: Renders a orange disk with center (94, 80) and radius 80.
; PLAN: r0=94(x), r1=80(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 80
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
