; DESCRIPTION: Draws a magenta line from (211, 26) to (1, 190).
; PLAN: r0=211(x1), r1=26(y1), r2=1(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 26
LDI r2, 1
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
