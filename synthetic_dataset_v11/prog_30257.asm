; DESCRIPTION: Places a orange circle of radius 20 at center (159, 204).
; PLAN: r0=159(x), r1=204(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 204
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
