; DESCRIPTION: Draws a magenta line from (243, 30) to (201, 247).
; PLAN: r0=243(x1), r1=30(y1), r2=201(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 30
LDI r2, 201
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
