; DESCRIPTION: Draws a purple line from (141, 194) to (291, 194).
; PLAN: r0=141(x1), r1=194(y1), r2=291(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 194
LDI r2, 291
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
