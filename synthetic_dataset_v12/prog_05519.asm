; DESCRIPTION: Draws a magenta line from (396, 57) to (423, 247).
; PLAN: r0=396(x1), r1=57(y1), r2=423(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 57
LDI r2, 423
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
