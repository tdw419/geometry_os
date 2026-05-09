; DESCRIPTION: Renders a magenta line between points (78, 19) and (2, 137).
; PLAN: r0=78(x1), r1=19(y1), r2=2(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 19
LDI r2, 2
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
