; DESCRIPTION: Draws a black line from (302, 149) to (292, 155).
; PLAN: r0=302(x1), r1=149(y1), r2=292(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 149
LDI r2, 292
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
