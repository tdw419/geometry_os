; DESCRIPTION: Draws a purple line from (133, 99) to (138, 199).
; PLAN: r0=133(x1), r1=99(y1), r2=138(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 99
LDI r2, 138
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
