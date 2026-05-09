; DESCRIPTION: Draws a purple line from (153, 197) to (132, 15).
; PLAN: r0=153(x1), r1=197(y1), r2=132(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 197
LDI r2, 132
LDI r3, 15
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
