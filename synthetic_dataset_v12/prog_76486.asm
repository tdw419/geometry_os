; DESCRIPTION: Places a purple line segment connecting (283, 45) to (157, 117).
; PLAN: r0=283(x1), r1=45(y1), r2=157(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 45
LDI r2, 157
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
