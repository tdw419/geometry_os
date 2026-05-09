; DESCRIPTION: Places a yellow line segment connecting (178, 169) to (118, 142).
; PLAN: r0=178(x1), r1=169(y1), r2=118(x2), r3=142(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 169
LDI r2, 118
LDI r3, 142
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
