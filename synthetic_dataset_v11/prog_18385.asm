; DESCRIPTION: Draws a purple line from (226, 209) to (232, 212).
; PLAN: r0=226(x1), r1=209(y1), r2=232(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 209
LDI r2, 232
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
