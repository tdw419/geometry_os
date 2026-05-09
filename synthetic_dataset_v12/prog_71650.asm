; DESCRIPTION: Draws a magenta line from (321, 109) to (409, 172).
; PLAN: r0=321(x1), r1=109(y1), r2=409(x2), r3=172(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 109
LDI r2, 409
LDI r3, 172
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
