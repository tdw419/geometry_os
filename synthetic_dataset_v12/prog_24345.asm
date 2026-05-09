; DESCRIPTION: Draws a purple line from (25, 113) to (107, 175).
; PLAN: r0=25(x1), r1=113(y1), r2=107(x2), r3=175(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 113
LDI r2, 107
LDI r3, 175
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
