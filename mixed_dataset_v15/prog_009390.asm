; DESCRIPTION: Places a purple line segment connecting (376, 150) to (206, 158).
; PLAN: r0=376(x1), r1=150(y1), r2=206(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 150
LDI r2, 206
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
