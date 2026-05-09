; DESCRIPTION: Renders a magenta line between points (26, 89) and (254, 44).
; PLAN: r0=26(x1), r1=89(y1), r2=254(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 89
LDI r2, 254
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
