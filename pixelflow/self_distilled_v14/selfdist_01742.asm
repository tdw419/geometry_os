; DESCRIPTION: Places a red disk with center (261, 110) and radius 73.
; PLAN: r0=261(x), r1=110(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 110
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
