; DESCRIPTION: Places a purple circle of radius 69 at center (338, 110).
; PLAN: r0=338(x), r1=110(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 110
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
