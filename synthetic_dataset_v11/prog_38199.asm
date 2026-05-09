; DESCRIPTION: Places a blue circle of radius 31 at center (225, 155).
; PLAN: r0=225(x), r1=155(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 155
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
