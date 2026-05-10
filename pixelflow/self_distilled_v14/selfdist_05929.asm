; DESCRIPTION: Renders a magenta line segment connecting (323, 180) to (193, 156).
; PLAN: r0=323(x1), r1=180(y1), r2=193(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 180
LDI r2, 193
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
