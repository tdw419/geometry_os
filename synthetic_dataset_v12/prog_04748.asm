; DESCRIPTION: Renders a magenta line between points (6, 151) and (137, 22).
; PLAN: r0=6(x1), r1=151(y1), r2=137(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 151
LDI r2, 137
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
