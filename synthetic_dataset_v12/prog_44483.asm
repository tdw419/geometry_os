; DESCRIPTION: Renders a red line between points (44, 132) and (437, 147).
; PLAN: r0=44(x1), r1=132(y1), r2=437(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 132
LDI r2, 437
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
