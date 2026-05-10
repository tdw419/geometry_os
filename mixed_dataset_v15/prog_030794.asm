; DESCRIPTION: Places a blue circle of radius 11 at center (430, 239).
; PLAN: r0=430(x), r1=239(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 239
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
