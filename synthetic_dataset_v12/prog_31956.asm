; DESCRIPTION: Draws a magenta line from (142, 211) to (150, 216).
; PLAN: r0=142(x1), r1=211(y1), r2=150(x2), r3=216(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 211
LDI r2, 150
LDI r3, 216
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
