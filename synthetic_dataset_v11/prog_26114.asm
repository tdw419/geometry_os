; DESCRIPTION: Draws a yellow line from (89, 24) to (56, 98).
; PLAN: r0=89(x1), r1=24(y1), r2=56(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 24
LDI r2, 56
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
