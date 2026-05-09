; DESCRIPTION: Places a black line segment connecting (194, 99) to (158, 236).
; PLAN: r0=194(x1), r1=99(y1), r2=158(x2), r3=236(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 99
LDI r2, 158
LDI r3, 236
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
