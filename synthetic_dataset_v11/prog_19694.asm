; DESCRIPTION: Renders a magenta line between points (106, 247) and (63, 95).
; PLAN: r0=106(x1), r1=247(y1), r2=63(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 247
LDI r2, 63
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
