; DESCRIPTION: Renders a magenta line between points (100, 174) and (159, 85).
; PLAN: r0=100(x1), r1=174(y1), r2=159(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 174
LDI r2, 159
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
