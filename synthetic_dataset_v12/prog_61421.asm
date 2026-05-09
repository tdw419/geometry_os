; DESCRIPTION: Draws a purple line from (287, 117) to (35, 117).
; PLAN: r0=287(x1), r1=117(y1), r2=35(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 117
LDI r2, 35
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
