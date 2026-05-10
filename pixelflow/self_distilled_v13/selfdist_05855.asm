; DESCRIPTION: Draws a purple line from (212, 84) to (181, 107).
; PLAN: r0=212(x1), r1=84(y1), r2=181(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 84
LDI r2, 181
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
