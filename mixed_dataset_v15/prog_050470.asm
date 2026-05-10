; DESCRIPTION: Draws a purple line from (456, 54) to (278, 199).
; PLAN: r0=456(x1), r1=54(y1), r2=278(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 54
LDI r2, 278
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
