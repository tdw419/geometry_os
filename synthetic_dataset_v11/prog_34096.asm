; DESCRIPTION: Renders a orange disk with center (104, 200) and radius 18.
; PLAN: r0=104(x), r1=200(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 200
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
