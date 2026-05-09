; DESCRIPTION: Places a green line segment connecting (136, 159) to (187, 77).
; PLAN: r0=136(x1), r1=159(y1), r2=187(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 159
LDI r2, 187
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
