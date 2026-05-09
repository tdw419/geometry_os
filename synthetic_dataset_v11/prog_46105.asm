; DESCRIPTION: Places a green circle of radius 60 at center (112, 62).
; PLAN: r0=112(x), r1=62(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 62
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
