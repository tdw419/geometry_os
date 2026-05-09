; DESCRIPTION: Renders a magenta line between points (149, 65) and (33, 181).
; PLAN: r0=149(x1), r1=65(y1), r2=33(x2), r3=181(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 65
LDI r2, 33
LDI r3, 181
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
