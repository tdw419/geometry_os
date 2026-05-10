; DESCRIPTION: Draws a magenta line from (396, 193) to (6, 87).
; PLAN: r0=396(x1), r1=193(y1), r2=6(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 193
LDI r2, 6
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
