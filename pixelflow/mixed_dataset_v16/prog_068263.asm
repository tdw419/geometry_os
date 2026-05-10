; DESCRIPTION: Places a red line segment connecting (26, 7) to (414, 170).
; PLAN: r0=26(x1), r1=7(y1), r2=414(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 7
LDI r2, 414
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
