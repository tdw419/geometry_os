; DESCRIPTION: Places a blue circle of radius 13 at center (112, 159).
; PLAN: r0=112(x), r1=159(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 159
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
