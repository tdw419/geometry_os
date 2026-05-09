; DESCRIPTION: Renders a blue line between points (357, 0) and (132, 95).
; PLAN: r0=357(x1), r1=0(y1), r2=132(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 0
LDI r2, 132
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
