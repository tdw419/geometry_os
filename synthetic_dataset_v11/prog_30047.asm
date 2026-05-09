; DESCRIPTION: Renders a magenta line between points (7, 66) and (75, 84).
; PLAN: r0=7(x1), r1=66(y1), r2=75(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 66
LDI r2, 75
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
