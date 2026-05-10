; DESCRIPTION: Places a yellow line segment connecting (463, 56) to (297, 37).
; PLAN: r0=463(x1), r1=56(y1), r2=297(x2), r3=37(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 56
LDI r2, 297
LDI r3, 37
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
