; DESCRIPTION: Draws a purple line from (46, 76) to (84, 254).
; PLAN: r0=46(x1), r1=76(y1), r2=84(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 76
LDI r2, 84
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
