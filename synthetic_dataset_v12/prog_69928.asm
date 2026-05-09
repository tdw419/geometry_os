; DESCRIPTION: Draws a purple line from (195, 85) to (430, 38).
; PLAN: r0=195(x1), r1=85(y1), r2=430(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 85
LDI r2, 430
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
