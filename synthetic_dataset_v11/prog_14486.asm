; DESCRIPTION: Draws a yellow line from (1, 121) to (133, 250).
; PLAN: r0=1(x1), r1=121(y1), r2=133(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 121
LDI r2, 133
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
