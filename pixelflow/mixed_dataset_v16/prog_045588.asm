; DESCRIPTION: Draws a magenta line from (324, 201) to (130, 86).
; PLAN: r0=324(x1), r1=201(y1), r2=130(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 201
LDI r2, 130
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
