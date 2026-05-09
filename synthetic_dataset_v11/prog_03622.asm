; DESCRIPTION: Draws a red line from (178, 94) to (88, 154).
; PLAN: r0=178(x1), r1=94(y1), r2=88(x2), r3=154(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 94
LDI r2, 88
LDI r3, 154
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
