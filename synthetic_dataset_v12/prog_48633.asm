; DESCRIPTION: Draws a purple line from (125, 89) to (62, 173).
; PLAN: r0=125(x1), r1=89(y1), r2=62(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 89
LDI r2, 62
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
