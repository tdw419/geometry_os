; DESCRIPTION: Draws a magenta line from (201, 74) to (266, 63).
; PLAN: r0=201(x1), r1=74(y1), r2=266(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 74
LDI r2, 266
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
