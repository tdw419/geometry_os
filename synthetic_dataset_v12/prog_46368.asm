; DESCRIPTION: Draws a purple line from (91, 29) to (296, 250).
; PLAN: r0=91(x1), r1=29(y1), r2=296(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 29
LDI r2, 296
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
