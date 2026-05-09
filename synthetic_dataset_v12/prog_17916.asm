; DESCRIPTION: Draws a purple line from (315, 204) to (42, 190).
; PLAN: r0=315(x1), r1=204(y1), r2=42(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 204
LDI r2, 42
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
