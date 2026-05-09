; DESCRIPTION: Places a yellow line segment connecting (241, 118) to (249, 56).
; PLAN: r0=241(x1), r1=118(y1), r2=249(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 118
LDI r2, 249
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
