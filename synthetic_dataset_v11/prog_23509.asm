; DESCRIPTION: Draws a purple line from (51, 50) to (3, 246).
; PLAN: r0=51(x1), r1=50(y1), r2=3(x2), r3=246(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 50
LDI r2, 3
LDI r3, 246
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
