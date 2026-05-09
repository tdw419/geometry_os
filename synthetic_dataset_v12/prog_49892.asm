; DESCRIPTION: Places a red line segment connecting (265, 246) to (88, 181).
; PLAN: r0=265(x1), r1=246(y1), r2=88(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 246
LDI r2, 88
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
