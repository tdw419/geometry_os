; DESCRIPTION: Places a red line segment connecting (490, 109) to (358, 12).
; PLAN: r0=490(x1), r1=109(y1), r2=358(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 109
LDI r2, 358
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
