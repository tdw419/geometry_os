; DESCRIPTION: Places a blue circle of radius 11 at center (117, 133).
; PLAN: r0=117(x), r1=133(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 133
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
