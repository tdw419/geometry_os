; DESCRIPTION: Draws a orange line from (149, 230) to (192, 23).
; PLAN: r0=149(x1), r1=230(y1), r2=192(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 230
LDI r2, 192
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
