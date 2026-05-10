; DESCRIPTION: Draws a black line from (471, 192) to (451, 37).
; PLAN: r0=471(x1), r1=192(y1), r2=451(x2), r3=37(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 192
LDI r2, 451
LDI r3, 37
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
