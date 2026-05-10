; DESCRIPTION: Draws a yellow line from (351, 73) to (396, 190).
; PLAN: r0=351(x1), r1=73(y1), r2=396(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 73
LDI r2, 396
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
