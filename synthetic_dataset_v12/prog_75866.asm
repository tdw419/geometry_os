; DESCRIPTION: Renders a magenta line between points (338, 25) and (357, 238).
; PLAN: r0=338(x1), r1=25(y1), r2=357(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 25
LDI r2, 357
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
