; DESCRIPTION: Draws a magenta line from (89, 134) to (202, 232).
; PLAN: r0=89(x1), r1=134(y1), r2=202(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 134
LDI r2, 202
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
