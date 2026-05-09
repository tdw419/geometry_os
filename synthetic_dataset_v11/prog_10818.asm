; DESCRIPTION: Places a blue circle of radius 39 at center (189, 85).
; PLAN: r0=189(x), r1=85(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 85
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
