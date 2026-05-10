; DESCRIPTION: Draws a magenta line from (159, 126) to (396, 77).
; PLAN: r0=159(x1), r1=126(y1), r2=396(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 126
LDI r2, 396
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
