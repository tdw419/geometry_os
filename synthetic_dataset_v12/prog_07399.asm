; DESCRIPTION: Draws a purple line from (228, 158) to (24, 246).
; PLAN: r0=228(x1), r1=158(y1), r2=24(x2), r3=246(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 158
LDI r2, 24
LDI r3, 246
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
