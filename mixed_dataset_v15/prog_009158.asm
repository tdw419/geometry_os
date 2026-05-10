; DESCRIPTION: Renders a magenta line between points (75, 195) and (141, 79).
; PLAN: r0=75(x1), r1=195(y1), r2=141(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 195
LDI r2, 141
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
