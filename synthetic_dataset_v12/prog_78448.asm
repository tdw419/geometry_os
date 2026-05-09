; DESCRIPTION: Draws a magenta line from (367, 190) to (222, 158).
; PLAN: r0=367(x1), r1=190(y1), r2=222(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 190
LDI r2, 222
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
