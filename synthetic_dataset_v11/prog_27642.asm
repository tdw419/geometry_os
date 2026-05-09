; DESCRIPTION: Places a magenta line segment connecting (132, 6) to (125, 153).
; PLAN: r0=132(x1), r1=6(y1), r2=125(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 6
LDI r2, 125
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
