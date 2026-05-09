; DESCRIPTION: Places a purple circle of radius 31 at center (317, 200).
; PLAN: r0=317(x), r1=200(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 200
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
