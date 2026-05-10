; DESCRIPTION: Places a red line segment connecting (332, 14) to (30, 252).
; PLAN: r0=332(x1), r1=14(y1), r2=30(x2), r3=252(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 14
LDI r2, 30
LDI r3, 252
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
