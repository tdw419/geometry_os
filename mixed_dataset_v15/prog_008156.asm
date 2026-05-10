; DESCRIPTION: Renders a magenta line segment connecting (75, 84) to (132, 83).
; PLAN: r0=75(x1), r1=84(y1), r2=132(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 84
LDI r2, 132
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
