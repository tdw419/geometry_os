; DESCRIPTION: Draws a green line from (201, 65) to (127, 156).
; PLAN: r0=201(x1), r1=65(y1), r2=127(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 65
LDI r2, 127
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
