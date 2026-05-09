; DESCRIPTION: Places a green circle of radius 73 at center (342, 157).
; PLAN: r0=342(x), r1=157(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 157
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
