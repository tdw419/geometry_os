; DESCRIPTION: Places a purple line segment connecting (42, 218) to (90, 254).
; PLAN: r0=42(x1), r1=218(y1), r2=90(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 218
LDI r2, 90
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
