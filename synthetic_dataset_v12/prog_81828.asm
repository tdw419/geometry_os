; DESCRIPTION: Places a purple line segment connecting (50, 189) to (334, 167).
; PLAN: r0=50(x1), r1=189(y1), r2=334(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 189
LDI r2, 334
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
