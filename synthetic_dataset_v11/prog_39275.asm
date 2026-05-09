; DESCRIPTION: Renders a magenta line between points (236, 84) and (250, 2).
; PLAN: r0=236(x1), r1=84(y1), r2=250(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 84
LDI r2, 250
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
