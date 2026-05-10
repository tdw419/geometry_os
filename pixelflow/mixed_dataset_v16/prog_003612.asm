; DESCRIPTION: Renders a magenta line between points (377, 142) and (310, 78).
; PLAN: r0=377(x1), r1=142(y1), r2=310(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 142
LDI r2, 310
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
