; DESCRIPTION: Draws a magenta line from (155, 114) to (140, 188).
; PLAN: r0=155(x1), r1=114(y1), r2=140(x2), r3=188(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 114
LDI r2, 140
LDI r3, 188
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
