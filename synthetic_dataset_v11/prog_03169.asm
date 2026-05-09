; DESCRIPTION: Draws a purple line from (15, 50) to (195, 240).
; PLAN: r0=15(x1), r1=50(y1), r2=195(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 50
LDI r2, 195
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
