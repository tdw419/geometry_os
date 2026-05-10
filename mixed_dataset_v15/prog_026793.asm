; DESCRIPTION: Draws a black line from (478, 222) to (451, 161).
; PLAN: r0=478(x1), r1=222(y1), r2=451(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 222
LDI r2, 451
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
