; DESCRIPTION: Draws a red line from (252, 92) to (253, 56).
; PLAN: r0=252(x1), r1=92(y1), r2=253(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 92
LDI r2, 253
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
