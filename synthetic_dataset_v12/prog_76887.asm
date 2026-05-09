; DESCRIPTION: Places a purple line segment connecting (184, 229) to (200, 172).
; PLAN: r0=184(x1), r1=229(y1), r2=200(x2), r3=172(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 229
LDI r2, 200
LDI r3, 172
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
