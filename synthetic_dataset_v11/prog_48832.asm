; DESCRIPTION: Places a black line segment connecting (114, 31) to (24, 188).
; PLAN: r0=114(x1), r1=31(y1), r2=24(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 31
LDI r2, 24
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
