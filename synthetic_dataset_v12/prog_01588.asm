; DESCRIPTION: Places a green circle of radius 46 at center (142, 163).
; PLAN: r0=142(x), r1=163(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 163
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
