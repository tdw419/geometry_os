; DESCRIPTION: Draws a purple line from (108, 207) to (95, 190).
; PLAN: r0=108(x1), r1=207(y1), r2=95(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 207
LDI r2, 95
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
