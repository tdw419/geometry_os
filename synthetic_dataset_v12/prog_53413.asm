; DESCRIPTION: Draws a red line from (155, 127) to (243, 133).
; PLAN: r0=155(x1), r1=127(y1), r2=243(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 127
LDI r2, 243
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
