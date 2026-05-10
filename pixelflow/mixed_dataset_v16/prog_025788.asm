; DESCRIPTION: Renders a red line between points (9, 248) and (236, 147).
; PLAN: r0=9(x1), r1=248(y1), r2=236(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 248
LDI r2, 236
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
