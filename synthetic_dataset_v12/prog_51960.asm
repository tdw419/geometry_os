; DESCRIPTION: Places a blue circle of radius 65 at center (204, 159).
; PLAN: r0=204(x), r1=159(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 159
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
