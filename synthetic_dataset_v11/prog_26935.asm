; DESCRIPTION: Draws a magenta line from (88, 190) to (139, 20).
; PLAN: r0=88(x1), r1=190(y1), r2=139(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 190
LDI r2, 139
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
