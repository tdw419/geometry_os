; DESCRIPTION: Draws a purple line from (209, 133) to (85, 131).
; PLAN: r0=209(x1), r1=133(y1), r2=85(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 133
LDI r2, 85
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
