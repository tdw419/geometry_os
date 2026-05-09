; DESCRIPTION: Draws a purple line from (86, 184) to (45, 84).
; PLAN: r0=86(x1), r1=184(y1), r2=45(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 184
LDI r2, 45
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
