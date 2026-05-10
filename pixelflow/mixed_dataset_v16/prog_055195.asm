; DESCRIPTION: Renders a magenta line between points (87, 112) and (429, 230).
; PLAN: r0=87(x1), r1=112(y1), r2=429(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 112
LDI r2, 429
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
