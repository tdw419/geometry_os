; DESCRIPTION: Draws a magenta line from (354, 201) to (372, 246).
; PLAN: r0=354(x1), r1=201(y1), r2=372(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 201
LDI r2, 372
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
