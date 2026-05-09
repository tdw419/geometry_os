; DESCRIPTION: Places a red line segment connecting (112, 123) to (26, 154).
; PLAN: r0=112(x1), r1=123(y1), r2=26(x2), r3=154(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 123
LDI r2, 26
LDI r3, 154
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
