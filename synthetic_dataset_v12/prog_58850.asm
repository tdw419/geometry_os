; DESCRIPTION: Places a blue circle of radius 48 at center (55, 159).
; PLAN: r0=55(x), r1=159(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 159
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
