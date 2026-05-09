; DESCRIPTION: Renders a magenta line between points (172, 7) and (219, 119).
; PLAN: r0=172(x1), r1=7(y1), r2=219(x2), r3=119(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 7
LDI r2, 219
LDI r3, 119
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
