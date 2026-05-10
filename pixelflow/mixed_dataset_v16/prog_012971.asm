; DESCRIPTION: Draws a purple line from (84, 199) to (193, 254).
; PLAN: r0=84(x1), r1=199(y1), r2=193(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 199
LDI r2, 193
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
