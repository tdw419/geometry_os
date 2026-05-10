; DESCRIPTION: Draws a yellow line from (432, 0) to (190, 158).
; PLAN: r0=432(x1), r1=0(y1), r2=190(x2), r3=158(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 0
LDI r2, 190
LDI r3, 158
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
