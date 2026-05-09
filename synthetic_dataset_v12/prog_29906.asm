; DESCRIPTION: Draws a purple line from (456, 37) to (142, 190).
; PLAN: r0=456(x1), r1=37(y1), r2=142(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 37
LDI r2, 142
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
