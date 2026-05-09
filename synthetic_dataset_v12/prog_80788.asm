; DESCRIPTION: Draws a black line from (451, 237) to (446, 33).
; PLAN: r0=451(x1), r1=237(y1), r2=446(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 237
LDI r2, 446
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
