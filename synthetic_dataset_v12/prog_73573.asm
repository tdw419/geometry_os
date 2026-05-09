; DESCRIPTION: Places a purple line segment connecting (42, 66) to (13, 168).
; PLAN: r0=42(x1), r1=66(y1), r2=13(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 66
LDI r2, 13
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
