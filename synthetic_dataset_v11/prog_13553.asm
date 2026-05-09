; DESCRIPTION: Renders a magenta line between points (170, 125) and (22, 135).
; PLAN: r0=170(x1), r1=125(y1), r2=22(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 125
LDI r2, 22
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
