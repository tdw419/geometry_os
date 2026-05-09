; DESCRIPTION: Places a green line segment connecting (115, 136) to (105, 189).
; PLAN: r0=115(x1), r1=136(y1), r2=105(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 136
LDI r2, 105
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
