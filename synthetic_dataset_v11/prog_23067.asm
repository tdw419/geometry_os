; DESCRIPTION: Places a orange circle of radius 48 at center (129, 200).
; PLAN: r0=129(x), r1=200(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 200
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
