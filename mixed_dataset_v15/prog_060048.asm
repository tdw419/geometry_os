; DESCRIPTION: Draws a red line from (414, 9) to (246, 88).
; PLAN: r0=414(x1), r1=9(y1), r2=246(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 9
LDI r2, 246
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
