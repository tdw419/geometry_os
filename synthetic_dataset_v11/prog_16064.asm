; DESCRIPTION: Draws a purple line from (156, 201) to (1, 228).
; PLAN: r0=156(x1), r1=201(y1), r2=1(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 201
LDI r2, 1
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
