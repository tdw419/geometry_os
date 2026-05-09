; DESCRIPTION: Places a blue circle of radius 23 at center (117, 200).
; PLAN: r0=117(x), r1=200(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 200
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
