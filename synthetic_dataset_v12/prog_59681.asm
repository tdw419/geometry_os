; DESCRIPTION: Renders a orange line between points (147, 247) and (352, 66).
; PLAN: r0=147(x1), r1=247(y1), r2=352(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 247
LDI r2, 352
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
