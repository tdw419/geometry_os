; DESCRIPTION: Draws a red line from (8, 169) to (11, 141).
; PLAN: r0=8(x1), r1=169(y1), r2=11(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 169
LDI r2, 11
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
