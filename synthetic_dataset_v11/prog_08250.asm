; DESCRIPTION: Renders a magenta line between points (163, 23) and (66, 243).
; PLAN: r0=163(x1), r1=23(y1), r2=66(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 23
LDI r2, 66
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
