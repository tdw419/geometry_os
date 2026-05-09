; DESCRIPTION: Draws a purple line from (211, 105) to (17, 40).
; PLAN: r0=211(x1), r1=105(y1), r2=17(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 105
LDI r2, 17
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
