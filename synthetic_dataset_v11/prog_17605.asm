; DESCRIPTION: Draws a green line from (149, 78) to (145, 23).
; PLAN: r0=149(x1), r1=78(y1), r2=145(x2), r3=23(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 78
LDI r2, 145
LDI r3, 23
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
