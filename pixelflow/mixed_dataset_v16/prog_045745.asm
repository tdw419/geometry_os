; DESCRIPTION: Places a purple line segment connecting (420, 232) to (491, 117).
; PLAN: r0=420(x1), r1=232(y1), r2=491(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 232
LDI r2, 491
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
