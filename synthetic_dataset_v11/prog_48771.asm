; DESCRIPTION: Draws a yellow line from (9, 195) to (74, 201).
; PLAN: r0=9(x1), r1=195(y1), r2=74(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 195
LDI r2, 74
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
