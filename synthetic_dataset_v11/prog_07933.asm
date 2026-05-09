; DESCRIPTION: Draws a orange line from (21, 182) to (189, 147).
; PLAN: r0=21(x1), r1=182(y1), r2=189(x2), r3=147(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 182
LDI r2, 189
LDI r3, 147
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
