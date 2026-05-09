; DESCRIPTION: Places a green circle of radius 62 at center (382, 159).
; PLAN: r0=382(x), r1=159(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 159
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
