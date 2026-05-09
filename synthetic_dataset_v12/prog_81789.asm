; DESCRIPTION: Places a yellow line segment connecting (203, 31) to (463, 141).
; PLAN: r0=203(x1), r1=31(y1), r2=463(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 31
LDI r2, 463
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
