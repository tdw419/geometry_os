; DESCRIPTION: Places a blue circle of radius 60 at center (332, 109).
; PLAN: r0=332(x), r1=109(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 109
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
