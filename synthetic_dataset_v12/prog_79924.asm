; DESCRIPTION: Renders a magenta line between points (133, 23) and (92, 94).
; PLAN: r0=133(x1), r1=23(y1), r2=92(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 23
LDI r2, 92
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
