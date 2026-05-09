; DESCRIPTION: Renders a magenta line between points (135, 119) and (84, 150).
; PLAN: r0=135(x1), r1=119(y1), r2=84(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 119
LDI r2, 84
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
