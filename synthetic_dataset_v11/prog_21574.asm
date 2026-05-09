; DESCRIPTION: Draws a red line from (119, 156) to (142, 5).
; PLAN: r0=119(x1), r1=156(y1), r2=142(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 156
LDI r2, 142
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
