; DESCRIPTION: Draws a purple line from (63, 13) to (199, 179).
; PLAN: r0=63(x1), r1=13(y1), r2=199(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 13
LDI r2, 199
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
