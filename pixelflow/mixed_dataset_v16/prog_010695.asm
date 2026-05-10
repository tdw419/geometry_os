; DESCRIPTION: Places a red line segment connecting (400, 208) to (166, 147).
; PLAN: r0=400(x1), r1=208(y1), r2=166(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 208
LDI r2, 166
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
