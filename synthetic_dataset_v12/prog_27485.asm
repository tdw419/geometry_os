; DESCRIPTION: Places a purple circle of radius 53 at center (117, 125).
; PLAN: r0=117(x), r1=125(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 125
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
