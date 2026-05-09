; DESCRIPTION: Renders a magenta line between points (85, 51) and (100, 244).
; PLAN: r0=85(x1), r1=51(y1), r2=100(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 51
LDI r2, 100
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
