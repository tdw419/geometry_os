; DESCRIPTION: Renders a magenta line between points (390, 101) and (46, 149).
; PLAN: r0=390(x1), r1=101(y1), r2=46(x2), r3=149(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 101
LDI r2, 46
LDI r3, 149
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
