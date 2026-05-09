; DESCRIPTION: Places a red line segment connecting (137, 151) to (205, 252).
; PLAN: r0=137(x1), r1=151(y1), r2=205(x2), r3=252(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 151
LDI r2, 205
LDI r3, 252
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
