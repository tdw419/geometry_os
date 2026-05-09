; DESCRIPTION: Places a green circle of radius 39 at center (54, 49).
; PLAN: r0=54(x), r1=49(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 49
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
