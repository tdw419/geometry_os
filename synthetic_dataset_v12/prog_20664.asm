; DESCRIPTION: Places a purple line segment connecting (239, 94) to (78, 131).
; PLAN: r0=239(x1), r1=94(y1), r2=78(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 94
LDI r2, 78
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
