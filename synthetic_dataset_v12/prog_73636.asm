; DESCRIPTION: Draws a yellow line from (184, 84) to (191, 35).
; PLAN: r0=184(x1), r1=84(y1), r2=191(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 84
LDI r2, 191
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
