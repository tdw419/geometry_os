; DESCRIPTION: Places a red circle of radius 72 at center (142, 136).
; PLAN: r0=142(x), r1=136(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 136
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
