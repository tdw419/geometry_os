; DESCRIPTION: Places a magenta line segment connecting (53, 113) to (106, 110).
; PLAN: r0=53(x1), r1=113(y1), r2=106(x2), r3=110(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 113
LDI r2, 106
LDI r3, 110
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
