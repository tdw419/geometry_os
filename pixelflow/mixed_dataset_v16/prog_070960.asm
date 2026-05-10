; DESCRIPTION: Draws a purple line from (262, 133) to (177, 181).
; PLAN: r0=262(x1), r1=133(y1), r2=177(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 133
LDI r2, 177
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
