; DESCRIPTION: Places a black line segment connecting (93, 171) to (144, 34).
; PLAN: r0=93(x1), r1=171(y1), r2=144(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 171
LDI r2, 144
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
