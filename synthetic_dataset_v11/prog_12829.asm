; DESCRIPTION: Draws a green line from (133, 136) to (91, 163).
; PLAN: r0=133(x1), r1=136(y1), r2=91(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 136
LDI r2, 91
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
