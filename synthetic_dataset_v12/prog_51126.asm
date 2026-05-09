; DESCRIPTION: Places a red circle of radius 56 at center (456, 136).
; PLAN: r0=456(x), r1=136(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 136
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
