; DESCRIPTION: Places a blue circle of radius 17 at center (60, 45).
; PLAN: r0=60(x), r1=45(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 45
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
