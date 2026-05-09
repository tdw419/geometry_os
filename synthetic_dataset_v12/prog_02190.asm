; DESCRIPTION: Places a purple line segment connecting (448, 167) to (113, 63).
; PLAN: r0=448(x1), r1=167(y1), r2=113(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 167
LDI r2, 113
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
