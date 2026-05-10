; DESCRIPTION: Places a green circle of radius 70 at center (142, 109).
; PLAN: r0=142(x), r1=109(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 109
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
