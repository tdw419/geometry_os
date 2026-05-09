; DESCRIPTION: Places a purple line segment connecting (74, 85) to (195, 60).
; PLAN: r0=74(x1), r1=85(y1), r2=195(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 85
LDI r2, 195
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
