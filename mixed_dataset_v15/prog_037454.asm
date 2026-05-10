; DESCRIPTION: Draws a purple line from (107, 11) to (50, 25).
; PLAN: r0=107(x1), r1=11(y1), r2=50(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 11
LDI r2, 50
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
