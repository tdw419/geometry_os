; DESCRIPTION: Places a red line segment connecting (77, 121) to (177, 252).
; PLAN: r0=77(x1), r1=121(y1), r2=177(x2), r3=252(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 121
LDI r2, 177
LDI r3, 252
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
