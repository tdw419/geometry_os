; DESCRIPTION: Places a purple circle of radius 37 at center (423, 125).
; PLAN: r0=423(x), r1=125(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 125
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
