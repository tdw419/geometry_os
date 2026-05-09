; DESCRIPTION: Renders a magenta line between points (81, 112) and (120, 95).
; PLAN: r0=81(x1), r1=112(y1), r2=120(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 112
LDI r2, 120
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
