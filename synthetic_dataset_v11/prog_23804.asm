; DESCRIPTION: Renders a magenta line between points (181, 250) and (25, 23).
; PLAN: r0=181(x1), r1=250(y1), r2=25(x2), r3=23(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 250
LDI r2, 25
LDI r3, 23
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
