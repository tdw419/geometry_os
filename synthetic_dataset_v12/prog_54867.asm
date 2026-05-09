; DESCRIPTION: Renders a magenta line between points (40, 12) and (358, 191).
; PLAN: r0=40(x1), r1=12(y1), r2=358(x2), r3=191(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 12
LDI r2, 358
LDI r3, 191
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
