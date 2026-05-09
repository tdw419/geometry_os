; DESCRIPTION: Places a purple line segment connecting (166, 224) to (126, 61).
; PLAN: r0=166(x1), r1=224(y1), r2=126(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 224
LDI r2, 126
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
