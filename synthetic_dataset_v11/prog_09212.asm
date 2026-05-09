; DESCRIPTION: Draws a magenta line from (58, 140) to (250, 44).
; PLAN: r0=58(x1), r1=140(y1), r2=250(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 140
LDI r2, 250
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
