; DESCRIPTION: Renders a magenta line between points (6, 75) and (233, 30).
; PLAN: r0=6(x1), r1=75(y1), r2=233(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 75
LDI r2, 233
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
