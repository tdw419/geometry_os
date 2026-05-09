; DESCRIPTION: Draws a purple line from (19, 234) to (434, 190).
; PLAN: r0=19(x1), r1=234(y1), r2=434(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 234
LDI r2, 434
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
