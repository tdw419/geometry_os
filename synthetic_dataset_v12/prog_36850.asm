; DESCRIPTION: Draws a purple line from (31, 133) to (184, 166).
; PLAN: r0=31(x1), r1=133(y1), r2=184(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 133
LDI r2, 184
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
