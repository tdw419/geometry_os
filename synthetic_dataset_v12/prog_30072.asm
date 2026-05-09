; DESCRIPTION: Places a purple line segment connecting (348, 230) to (304, 86).
; PLAN: r0=348(x1), r1=230(y1), r2=304(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 230
LDI r2, 304
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
