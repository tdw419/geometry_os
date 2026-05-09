; DESCRIPTION: Draws a purple line from (190, 43) to (167, 139).
; PLAN: r0=190(x1), r1=43(y1), r2=167(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 43
LDI r2, 167
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
