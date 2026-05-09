; DESCRIPTION: Places a red line segment connecting (290, 62) to (496, 169).
; PLAN: r0=290(x1), r1=62(y1), r2=496(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 62
LDI r2, 496
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
