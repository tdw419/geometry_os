; DESCRIPTION: Draws a magenta line from (140, 26) to (40, 142).
; PLAN: r0=140(x1), r1=26(y1), r2=40(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 26
LDI r2, 40
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
