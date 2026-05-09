; DESCRIPTION: Draws a blue line from (45, 132) to (49, 190).
; PLAN: r0=45(x1), r1=132(y1), r2=49(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 132
LDI r2, 49
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
