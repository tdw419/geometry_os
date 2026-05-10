; DESCRIPTION: Places a magenta line segment connecting (22, 29) to (360, 153).
; PLAN: r0=22(x1), r1=29(y1), r2=360(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 29
LDI r2, 360
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
