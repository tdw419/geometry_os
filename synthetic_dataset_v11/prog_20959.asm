; DESCRIPTION: Draws a black line from (169, 136) to (156, 75).
; PLAN: r0=169(x1), r1=136(y1), r2=156(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 136
LDI r2, 156
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
