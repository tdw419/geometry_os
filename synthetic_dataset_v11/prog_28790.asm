; DESCRIPTION: Places a purple line segment connecting (63, 83) to (241, 25).
; PLAN: r0=63(x1), r1=83(y1), r2=241(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 83
LDI r2, 241
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
