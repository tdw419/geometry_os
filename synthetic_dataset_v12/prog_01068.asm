; DESCRIPTION: Places a purple line segment connecting (205, 106) to (285, 161).
; PLAN: r0=205(x1), r1=106(y1), r2=285(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 106
LDI r2, 285
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
