; DESCRIPTION: Draws a purple line from (246, 8) to (292, 161).
; PLAN: r0=246(x1), r1=8(y1), r2=292(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 8
LDI r2, 292
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
