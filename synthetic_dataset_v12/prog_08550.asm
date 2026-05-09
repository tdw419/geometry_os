; DESCRIPTION: Places a red line segment connecting (414, 155) to (264, 89).
; PLAN: r0=414(x1), r1=155(y1), r2=264(x2), r3=89(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 155
LDI r2, 264
LDI r3, 89
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
