; DESCRIPTION: Draws a yellow line from (149, 127) to (12, 175).
; PLAN: r0=149(x1), r1=127(y1), r2=12(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 127
LDI r2, 12
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
