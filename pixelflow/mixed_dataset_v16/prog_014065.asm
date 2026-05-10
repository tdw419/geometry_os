; DESCRIPTION: Draws a magenta line from (3, 11) to (140, 23).
; PLAN: r0=3(x1), r1=11(y1), r2=140(x2), r3=23(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 11
LDI r2, 140
LDI r3, 23
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
