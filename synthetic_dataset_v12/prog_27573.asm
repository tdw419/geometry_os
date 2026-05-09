; DESCRIPTION: Renders a magenta line between points (119, 64) and (94, 163).
; PLAN: r0=119(x1), r1=64(y1), r2=94(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 64
LDI r2, 94
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
