; DESCRIPTION: Places a green circle of radius 35 at center (269, 129).
; PLAN: r0=269(x), r1=129(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 129
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
