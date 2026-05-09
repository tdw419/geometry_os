; DESCRIPTION: Renders a magenta line between points (357, 15) and (206, 88).
; PLAN: r0=357(x1), r1=15(y1), r2=206(x2), r3=88(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 15
LDI r2, 206
LDI r3, 88
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
