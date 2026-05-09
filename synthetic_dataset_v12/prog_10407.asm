; DESCRIPTION: Places a magenta line segment connecting (461, 6) to (505, 55).
; PLAN: r0=461(x1), r1=6(y1), r2=505(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 6
LDI r2, 505
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
