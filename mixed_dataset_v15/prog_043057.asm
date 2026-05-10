; DESCRIPTION: Draws a yellow line from (49, 21) to (201, 84).
; PLAN: r0=49(x1), r1=21(y1), r2=201(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 21
LDI r2, 201
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
