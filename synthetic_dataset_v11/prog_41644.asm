; DESCRIPTION: Renders a magenta line between points (79, 254) and (88, 145).
; PLAN: r0=79(x1), r1=254(y1), r2=88(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 254
LDI r2, 88
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
