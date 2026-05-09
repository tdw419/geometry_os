; DESCRIPTION: Renders a magenta line between points (101, 105) and (47, 11).
; PLAN: r0=101(x1), r1=105(y1), r2=47(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 105
LDI r2, 47
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
