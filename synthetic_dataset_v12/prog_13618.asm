; DESCRIPTION: Places a purple line segment connecting (326, 165) to (184, 75).
; PLAN: r0=326(x1), r1=165(y1), r2=184(x2), r3=75(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 165
LDI r2, 184
LDI r3, 75
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
