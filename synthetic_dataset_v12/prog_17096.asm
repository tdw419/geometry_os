; DESCRIPTION: Renders a magenta line between points (431, 222) and (78, 11).
; PLAN: r0=431(x1), r1=222(y1), r2=78(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 222
LDI r2, 78
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
