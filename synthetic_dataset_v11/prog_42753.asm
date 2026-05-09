; DESCRIPTION: Renders a magenta line between points (189, 119) and (190, 57).
; PLAN: r0=189(x1), r1=119(y1), r2=190(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 119
LDI r2, 190
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
