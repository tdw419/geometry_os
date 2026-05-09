; DESCRIPTION: Draws a red line from (66, 88) to (414, 6).
; PLAN: r0=66(x1), r1=88(y1), r2=414(x2), r3=6(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 88
LDI r2, 414
LDI r3, 6
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
