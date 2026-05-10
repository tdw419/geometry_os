; DESCRIPTION: Draws a blue line from (97, 119) to (245, 217).
; PLAN: r0=97(x1), r1=119(y1), r2=245(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 119
LDI r2, 245
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
