; DESCRIPTION: Draws a purple line from (19, 81) to (55, 178).
; PLAN: r0=19(x1), r1=81(y1), r2=55(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 81
LDI r2, 55
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
