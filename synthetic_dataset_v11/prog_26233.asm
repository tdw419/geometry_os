; DESCRIPTION: Draws a magenta line from (246, 200) to (118, 65).
; PLAN: r0=246(x1), r1=200(y1), r2=118(x2), r3=65(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 200
LDI r2, 118
LDI r3, 65
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
