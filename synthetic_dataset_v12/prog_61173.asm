; DESCRIPTION: Places a blue line segment connecting (296, 185) to (172, 14).
; PLAN: r0=296(x1), r1=185(y1), r2=172(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 185
LDI r2, 172
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
