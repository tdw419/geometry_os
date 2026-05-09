; DESCRIPTION: Places a purple line segment connecting (276, 6) to (214, 120).
; PLAN: r0=276(x1), r1=6(y1), r2=214(x2), r3=120(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 6
LDI r2, 214
LDI r3, 120
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
