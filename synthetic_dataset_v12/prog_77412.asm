; DESCRIPTION: Draws a purple line from (393, 28) to (47, 245).
; PLAN: r0=393(x1), r1=28(y1), r2=47(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 28
LDI r2, 47
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
