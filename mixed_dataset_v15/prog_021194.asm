; DESCRIPTION: Places a magenta line segment connecting (280, 105) to (456, 3).
; PLAN: r0=280(x1), r1=105(y1), r2=456(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 105
LDI r2, 456
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
