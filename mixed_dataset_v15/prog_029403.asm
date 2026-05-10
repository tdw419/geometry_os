; DESCRIPTION: Draws a purple line from (22, 54) to (296, 6).
; PLAN: r0=22(x1), r1=54(y1), r2=296(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 54
LDI r2, 296
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
