; DESCRIPTION: Draws a blue line from (290, 158) to (190, 150).
; PLAN: r0=290(x1), r1=158(y1), r2=190(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 158
LDI r2, 190
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
