; DESCRIPTION: Places a green circle of radius 33 at center (101, 62).
; PLAN: r0=101(x), r1=62(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 62
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
