; DESCRIPTION: Draws a purple line from (199, 232) to (25, 132).
; PLAN: r0=199(x1), r1=232(y1), r2=25(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 232
LDI r2, 25
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
