; DESCRIPTION: Draws a purple line from (85, 153) to (206, 36).
; PLAN: r0=85(x1), r1=153(y1), r2=206(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 153
LDI r2, 206
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
