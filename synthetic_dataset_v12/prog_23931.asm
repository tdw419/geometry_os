; DESCRIPTION: Renders a magenta line between points (274, 105) and (423, 13).
; PLAN: r0=274(x1), r1=105(y1), r2=423(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 105
LDI r2, 423
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
