; DESCRIPTION: Draws a purple line from (114, 210) to (133, 0).
; PLAN: r0=114(x1), r1=210(y1), r2=133(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 210
LDI r2, 133
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
