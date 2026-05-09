; DESCRIPTION: Renders a magenta line between points (454, 151) and (99, 89).
; PLAN: r0=454(x1), r1=151(y1), r2=99(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 151
LDI r2, 99
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
