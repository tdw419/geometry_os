; DESCRIPTION: Draws a magenta line from (160, 201) to (82, 50).
; PLAN: r0=160(x1), r1=201(y1), r2=82(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 201
LDI r2, 82
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
