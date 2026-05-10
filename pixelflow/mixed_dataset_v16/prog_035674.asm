; DESCRIPTION: Renders a magenta line between points (471, 3) and (56, 95).
; PLAN: r0=471(x1), r1=3(y1), r2=56(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 3
LDI r2, 56
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
