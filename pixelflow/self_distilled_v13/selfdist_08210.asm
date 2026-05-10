; DESCRIPTION: Places a red disk with center (137, 106) and radius 66.
; PLAN: r0=137(x), r1=106(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 106
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
