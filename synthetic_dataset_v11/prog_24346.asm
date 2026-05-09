; DESCRIPTION: Renders a magenta line between points (196, 98) and (88, 78).
; PLAN: r0=196(x1), r1=98(y1), r2=88(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 98
LDI r2, 88
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
