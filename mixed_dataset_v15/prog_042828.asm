; DESCRIPTION: Draws a black line from (133, 25) to (359, 74).
; PLAN: r0=133(x1), r1=25(y1), r2=359(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 25
LDI r2, 359
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
