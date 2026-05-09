; DESCRIPTION: Places a purple line segment connecting (200, 42) to (248, 212).
; PLAN: r0=200(x1), r1=42(y1), r2=248(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 42
LDI r2, 248
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
