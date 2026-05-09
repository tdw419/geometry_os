; DESCRIPTION: Renders a magenta line between points (94, 97) and (193, 211).
; PLAN: r0=94(x1), r1=97(y1), r2=193(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 97
LDI r2, 193
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
