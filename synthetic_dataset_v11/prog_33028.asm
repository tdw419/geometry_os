; DESCRIPTION: Draws a magenta line from (227, 249) to (90, 190).
; PLAN: r0=227(x1), r1=249(y1), r2=90(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 249
LDI r2, 90
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
