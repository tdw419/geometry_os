; DESCRIPTION: Places a red line segment connecting (136, 251) to (37, 251).
; PLAN: r0=136(x1), r1=251(y1), r2=37(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 251
LDI r2, 37
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
