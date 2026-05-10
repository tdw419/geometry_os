; DESCRIPTION: Draws a purple line from (68, 12) to (290, 74).
; PLAN: r0=68(x1), r1=12(y1), r2=290(x2), r3=74(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 12
LDI r2, 290
LDI r3, 74
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
