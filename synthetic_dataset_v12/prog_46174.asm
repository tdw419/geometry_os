; DESCRIPTION: Draws a magenta line from (302, 134) to (61, 176).
; PLAN: r0=302(x1), r1=134(y1), r2=61(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 134
LDI r2, 61
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
