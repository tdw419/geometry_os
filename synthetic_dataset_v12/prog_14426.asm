; DESCRIPTION: Places a blue circle of radius 58 at center (336, 149).
; PLAN: r0=336(x), r1=149(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 149
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
