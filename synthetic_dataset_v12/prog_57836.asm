; DESCRIPTION: Renders a magenta line between points (63, 211) and (25, 106).
; PLAN: r0=63(x1), r1=211(y1), r2=25(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 211
LDI r2, 25
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
