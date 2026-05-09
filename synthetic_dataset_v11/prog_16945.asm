; DESCRIPTION: Places a red line segment connecting (8, 105) to (116, 154).
; PLAN: r0=8(x1), r1=105(y1), r2=116(x2), r3=154(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 105
LDI r2, 116
LDI r3, 154
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
