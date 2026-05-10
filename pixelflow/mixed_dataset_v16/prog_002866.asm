; DESCRIPTION: Draws a purple line from (454, 111) to (45, 190).
; PLAN: r0=454(x1), r1=111(y1), r2=45(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 111
LDI r2, 45
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
