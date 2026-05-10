; DESCRIPTION: Places a green line segment connecting (192, 185) to (52, 89).
; PLAN: r0=192(x1), r1=185(y1), r2=52(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 185
LDI r2, 52
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
