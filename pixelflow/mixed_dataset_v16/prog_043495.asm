; DESCRIPTION: Places a red disk with center (162, 119) and radius 15.
; PLAN: r0=162(x), r1=119(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 119
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
