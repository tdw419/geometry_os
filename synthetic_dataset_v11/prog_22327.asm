; DESCRIPTION: Places a yellow line segment connecting (89, 152) to (52, 105).
; PLAN: r0=89(x1), r1=152(y1), r2=52(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 152
LDI r2, 52
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
