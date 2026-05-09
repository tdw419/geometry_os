; DESCRIPTION: Places a red line segment connecting (147, 140) to (170, 188).
; PLAN: r0=147(x1), r1=140(y1), r2=170(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 140
LDI r2, 170
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
