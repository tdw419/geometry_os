; DESCRIPTION: Places a red disk with center (2, 118) and radius 15.
; PLAN: r0=2(x), r1=118(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 2
LDI r1, 118
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
