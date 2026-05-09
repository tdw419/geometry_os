; DESCRIPTION: Draws a magenta line from (76, 190) to (5, 10).
; PLAN: r0=76(x1), r1=190(y1), r2=5(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 190
LDI r2, 5
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
