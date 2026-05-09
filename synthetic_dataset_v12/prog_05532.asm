; DESCRIPTION: Places a purple line segment connecting (15, 62) to (168, 150).
; PLAN: r0=15(x1), r1=62(y1), r2=168(x2), r3=150(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 62
LDI r2, 168
LDI r3, 150
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
