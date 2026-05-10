; DESCRIPTION: Draws a yellow line from (84, 149) to (149, 121).
; PLAN: r0=84(x1), r1=149(y1), r2=149(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 149
LDI r2, 149
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
