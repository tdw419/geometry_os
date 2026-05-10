; DESCRIPTION: Renders a magenta line between points (132, 210) and (233, 1).
; PLAN: r0=132(x1), r1=210(y1), r2=233(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 210
LDI r2, 233
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
