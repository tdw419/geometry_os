; DESCRIPTION: Renders a magenta line between points (366, 81) and (188, 15).
; PLAN: r0=366(x1), r1=81(y1), r2=188(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 81
LDI r2, 188
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
