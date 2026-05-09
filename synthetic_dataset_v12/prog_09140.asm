; DESCRIPTION: Renders a magenta line between points (285, 134) and (343, 230).
; PLAN: r0=285(x1), r1=134(y1), r2=343(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 134
LDI r2, 343
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
