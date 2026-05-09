; DESCRIPTION: Draws a blue line from (156, 140) to (47, 130).
; PLAN: r0=156(x1), r1=140(y1), r2=47(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 140
LDI r2, 47
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
