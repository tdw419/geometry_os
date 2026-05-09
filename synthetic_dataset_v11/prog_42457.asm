; DESCRIPTION: Renders a magenta line between points (120, 191) and (6, 203).
; PLAN: r0=120(x1), r1=191(y1), r2=6(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 191
LDI r2, 6
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
