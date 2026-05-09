; DESCRIPTION: Draws a magenta line from (140, 125) to (216, 43).
; PLAN: r0=140(x1), r1=125(y1), r2=216(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 125
LDI r2, 216
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
