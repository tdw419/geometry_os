; DESCRIPTION: Draws a green line from (11, 201) to (56, 127).
; PLAN: r0=11(x1), r1=201(y1), r2=56(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 201
LDI r2, 56
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
