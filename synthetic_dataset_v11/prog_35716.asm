; DESCRIPTION: Draws a yellow line from (125, 81) to (62, 140).
; PLAN: r0=125(x1), r1=81(y1), r2=62(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 81
LDI r2, 62
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
