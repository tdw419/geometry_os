; DESCRIPTION: Draws a green line from (84, 155) to (166, 41).
; PLAN: r0=84(x1), r1=155(y1), r2=166(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 155
LDI r2, 166
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
