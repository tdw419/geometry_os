; DESCRIPTION: Draws a purple line from (37, 45) to (334, 179).
; PLAN: r0=37(x1), r1=45(y1), r2=334(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 45
LDI r2, 334
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
