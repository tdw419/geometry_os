; DESCRIPTION: Renders a magenta line between points (150, 75) and (56, 158).
; PLAN: r0=150(x1), r1=75(y1), r2=56(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 75
LDI r2, 56
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
