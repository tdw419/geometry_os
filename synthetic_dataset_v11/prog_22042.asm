; DESCRIPTION: Renders a magenta line between points (31, 106) and (63, 94).
; PLAN: r0=31(x1), r1=106(y1), r2=63(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 106
LDI r2, 63
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
