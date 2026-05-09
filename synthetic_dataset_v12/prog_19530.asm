; DESCRIPTION: Renders a magenta line between points (429, 106) and (470, 181).
; PLAN: r0=429(x1), r1=106(y1), r2=470(x2), r3=181(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 106
LDI r2, 470
LDI r3, 181
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
