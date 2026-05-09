; DESCRIPTION: Places a red circle of radius 14 at center (24, 191).
; PLAN: r0=24(x), r1=191(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 24
LDI r1, 191
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
