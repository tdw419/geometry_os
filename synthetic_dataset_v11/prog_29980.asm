; DESCRIPTION: Draws a blue line from (149, 176) to (91, 7).
; PLAN: r0=149(x1), r1=176(y1), r2=91(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 176
LDI r2, 91
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
