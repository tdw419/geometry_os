; DESCRIPTION: Draws a purple line from (456, 189) to (190, 27).
; PLAN: r0=456(x1), r1=189(y1), r2=190(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 189
LDI r2, 190
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
