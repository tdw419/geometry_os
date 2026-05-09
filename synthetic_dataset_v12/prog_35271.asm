; DESCRIPTION: Draws a purple line from (436, 23) to (132, 168).
; PLAN: r0=436(x1), r1=23(y1), r2=132(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 23
LDI r2, 132
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
