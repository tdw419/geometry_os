; DESCRIPTION: Renders a magenta line between points (122, 123) and (23, 238).
; PLAN: r0=122(x1), r1=123(y1), r2=23(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 123
LDI r2, 23
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
