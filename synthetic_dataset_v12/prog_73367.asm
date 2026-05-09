; DESCRIPTION: Places a purple line segment connecting (184, 179) to (57, 168).
; PLAN: r0=184(x1), r1=179(y1), r2=57(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 179
LDI r2, 57
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
