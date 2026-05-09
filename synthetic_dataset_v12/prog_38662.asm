; DESCRIPTION: Draws a purple line from (16, 2) to (53, 205).
; PLAN: r0=16(x1), r1=2(y1), r2=53(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 2
LDI r2, 53
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
