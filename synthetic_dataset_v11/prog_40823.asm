; DESCRIPTION: Places a blue circle of radius 57 at center (68, 58).
; PLAN: r0=68(x), r1=58(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 58
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
