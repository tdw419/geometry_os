; DESCRIPTION: Renders a magenta line between points (193, 9) and (223, 191).
; PLAN: r0=193(x1), r1=9(y1), r2=223(x2), r3=191(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 9
LDI r2, 223
LDI r3, 191
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
