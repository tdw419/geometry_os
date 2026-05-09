; DESCRIPTION: Draws a green line from (201, 99) to (396, 127).
; PLAN: r0=201(x1), r1=99(y1), r2=396(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 99
LDI r2, 396
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
