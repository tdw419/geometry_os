; DESCRIPTION: Places a purple line segment connecting (135, 159) to (296, 68).
; PLAN: r0=135(x1), r1=159(y1), r2=296(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 159
LDI r2, 296
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
