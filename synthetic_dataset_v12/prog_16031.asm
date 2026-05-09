; DESCRIPTION: Places a red line segment connecting (169, 28) to (261, 154).
; PLAN: r0=169(x1), r1=28(y1), r2=261(x2), r3=154(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 28
LDI r2, 261
LDI r3, 154
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
