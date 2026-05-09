; DESCRIPTION: Renders a magenta line between points (353, 139) and (140, 130).
; PLAN: r0=353(x1), r1=139(y1), r2=140(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 139
LDI r2, 140
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
