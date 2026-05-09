; DESCRIPTION: Draws a yellow line from (307, 35) to (155, 89).
; PLAN: r0=307(x1), r1=35(y1), r2=155(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 35
LDI r2, 155
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
