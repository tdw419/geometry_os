; DESCRIPTION: Renders a magenta line between points (163, 157) and (37, 66).
; PLAN: r0=163(x1), r1=157(y1), r2=37(x2), r3=66(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 157
LDI r2, 37
LDI r3, 66
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
