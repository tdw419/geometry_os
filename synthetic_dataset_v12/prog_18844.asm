; DESCRIPTION: Renders a magenta line between points (63, 26) and (417, 79).
; PLAN: r0=63(x1), r1=26(y1), r2=417(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 26
LDI r2, 417
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
