; DESCRIPTION: Draws a purple line from (105, 222) to (272, 175).
; PLAN: r0=105(x1), r1=222(y1), r2=272(x2), r3=175(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 222
LDI r2, 272
LDI r3, 175
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
