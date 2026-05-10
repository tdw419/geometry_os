; DESCRIPTION: Draws a purple line from (211, 179) to (59, 206).
; PLAN: r0=211(x1), r1=179(y1), r2=59(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 179
LDI r2, 59
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
