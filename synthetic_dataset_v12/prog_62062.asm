; DESCRIPTION: Places a purple line segment connecting (61, 94) to (292, 160).
; PLAN: r0=61(x1), r1=94(y1), r2=292(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 94
LDI r2, 292
LDI r3, 160
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
