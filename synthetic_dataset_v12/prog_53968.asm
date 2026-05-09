; DESCRIPTION: Draws a magenta line from (89, 215) to (396, 15).
; PLAN: r0=89(x1), r1=215(y1), r2=396(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 215
LDI r2, 396
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
