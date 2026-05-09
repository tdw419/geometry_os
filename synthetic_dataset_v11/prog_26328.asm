; DESCRIPTION: Places a magenta line segment connecting (33, 55) to (149, 220).
; PLAN: r0=33(x1), r1=55(y1), r2=149(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 55
LDI r2, 149
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
