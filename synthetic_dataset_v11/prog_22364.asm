; DESCRIPTION: Draws a purple line from (25, 26) to (45, 93).
; PLAN: r0=25(x1), r1=26(y1), r2=45(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 26
LDI r2, 45
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
