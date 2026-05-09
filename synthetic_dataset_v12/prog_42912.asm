; DESCRIPTION: Places a magenta line segment connecting (119, 77) to (148, 113).
; PLAN: r0=119(x1), r1=77(y1), r2=148(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 77
LDI r2, 148
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
