; DESCRIPTION: Renders a magenta line between points (22, 63) and (148, 94).
; PLAN: r0=22(x1), r1=63(y1), r2=148(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 63
LDI r2, 148
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
