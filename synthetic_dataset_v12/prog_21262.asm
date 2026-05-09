; DESCRIPTION: Places a yellow line segment connecting (226, 5) to (136, 66).
; PLAN: r0=226(x1), r1=5(y1), r2=136(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 5
LDI r2, 136
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
