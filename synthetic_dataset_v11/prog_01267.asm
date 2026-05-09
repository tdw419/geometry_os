; DESCRIPTION: Draws a purple line from (212, 0) to (109, 93).
; PLAN: r0=212(x1), r1=0(y1), r2=109(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 0
LDI r2, 109
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
