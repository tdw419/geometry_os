; DESCRIPTION: Draws a purple line from (25, 42) to (124, 106).
; PLAN: r0=25(x1), r1=42(y1), r2=124(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 42
LDI r2, 124
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
