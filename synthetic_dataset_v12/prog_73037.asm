; DESCRIPTION: Places a red line segment connecting (25, 147) to (47, 52).
; PLAN: r0=25(x1), r1=147(y1), r2=47(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 147
LDI r2, 47
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
