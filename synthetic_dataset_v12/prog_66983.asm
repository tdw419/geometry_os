; DESCRIPTION: Draws a purple line from (321, 233) to (195, 88).
; PLAN: r0=321(x1), r1=233(y1), r2=195(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 233
LDI r2, 195
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
