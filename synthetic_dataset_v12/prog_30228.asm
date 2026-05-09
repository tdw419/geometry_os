; DESCRIPTION: Places a white line segment connecting (136, 252) to (463, 64).
; PLAN: r0=136(x1), r1=252(y1), r2=463(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 252
LDI r2, 463
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
