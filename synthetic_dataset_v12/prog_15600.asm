; DESCRIPTION: Draws a black line from (374, 122) to (396, 19).
; PLAN: r0=374(x1), r1=122(y1), r2=396(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 122
LDI r2, 396
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
