; DESCRIPTION: Places a blue circle of radius 58 at center (123, 81).
; PLAN: r0=123(x), r1=81(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 81
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
