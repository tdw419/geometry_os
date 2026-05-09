; DESCRIPTION: Draws a purple line from (141, 40) to (184, 37).
; PLAN: r0=141(x1), r1=40(y1), r2=184(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 40
LDI r2, 184
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
