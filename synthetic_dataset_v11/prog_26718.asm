; DESCRIPTION: Draws a purple line from (50, 38) to (191, 50).
; PLAN: r0=50(x1), r1=38(y1), r2=191(x2), r3=50(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 38
LDI r2, 191
LDI r3, 50
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
