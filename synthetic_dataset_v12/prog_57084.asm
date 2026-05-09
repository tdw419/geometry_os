; DESCRIPTION: Draws a purple line from (315, 17) to (272, 107).
; PLAN: r0=315(x1), r1=17(y1), r2=272(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 17
LDI r2, 272
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
