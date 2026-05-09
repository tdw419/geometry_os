; DESCRIPTION: Renders a orange disk with center (409, 44) and radius 12.
; PLAN: r0=409(x), r1=44(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 44
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
