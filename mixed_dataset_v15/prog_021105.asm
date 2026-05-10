; DESCRIPTION: Draws a purple line from (83, 42) to (244, 1).
; PLAN: r0=83(x1), r1=42(y1), r2=244(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 42
LDI r2, 244
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
