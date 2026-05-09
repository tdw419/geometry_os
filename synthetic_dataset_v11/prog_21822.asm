; DESCRIPTION: Renders a magenta line between points (232, 179) and (30, 180).
; PLAN: r0=232(x1), r1=179(y1), r2=30(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 179
LDI r2, 30
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
