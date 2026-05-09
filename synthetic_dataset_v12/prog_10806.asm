; DESCRIPTION: Draws a purple line from (292, 245) to (3, 136).
; PLAN: r0=292(x1), r1=245(y1), r2=3(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 245
LDI r2, 3
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
