; DESCRIPTION: Draws a yellow line from (140, 119) to (56, 60).
; PLAN: r0=140(x1), r1=119(y1), r2=56(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 119
LDI r2, 56
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
