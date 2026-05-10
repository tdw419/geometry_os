; DESCRIPTION: Draws a blue line from (455, 203) to (432, 190).
; PLAN: r0=455(x1), r1=203(y1), r2=432(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 203
LDI r2, 432
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
