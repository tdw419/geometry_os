; DESCRIPTION: Places a purple line segment connecting (268, 154) to (348, 205).
; PLAN: r0=268(x1), r1=154(y1), r2=348(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 154
LDI r2, 348
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
