; DESCRIPTION: Draws a magenta line from (45, 201) to (262, 14).
; PLAN: r0=45(x1), r1=201(y1), r2=262(x2), r3=14(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 201
LDI r2, 262
LDI r3, 14
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
