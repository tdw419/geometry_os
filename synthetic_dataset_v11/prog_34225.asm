; DESCRIPTION: Places a purple line segment connecting (205, 14) to (72, 42).
; PLAN: r0=205(x1), r1=14(y1), r2=72(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 14
LDI r2, 72
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
