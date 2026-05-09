; DESCRIPTION: Renders a red line between points (357, 252) and (361, 188).
; PLAN: r0=357(x1), r1=252(y1), r2=361(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 252
LDI r2, 361
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
