; DESCRIPTION: Renders a magenta line between points (198, 145) and (99, 148).
; PLAN: r0=198(x1), r1=145(y1), r2=99(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 145
LDI r2, 99
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
