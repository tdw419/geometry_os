; DESCRIPTION: Draws a orange line from (133, 81) to (121, 243).
; PLAN: r0=133(x1), r1=81(y1), r2=121(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 81
LDI r2, 121
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
