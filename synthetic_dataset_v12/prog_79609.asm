; DESCRIPTION: Draws a purple line from (336, 68) to (175, 50).
; PLAN: r0=336(x1), r1=68(y1), r2=175(x2), r3=50(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 68
LDI r2, 175
LDI r3, 50
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
