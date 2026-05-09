; DESCRIPTION: Draws a yellow line from (200, 187) to (122, 65).
; PLAN: r0=200(x1), r1=187(y1), r2=122(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 187
LDI r2, 122
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
