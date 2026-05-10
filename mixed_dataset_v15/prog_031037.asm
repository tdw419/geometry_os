; DESCRIPTION: Draws a purple line from (2, 133) to (442, 165).
; PLAN: r0=2(x1), r1=133(y1), r2=442(x2), r3=165(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 133
LDI r2, 442
LDI r3, 165
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
