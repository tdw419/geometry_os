; DESCRIPTION: Places a magenta line segment connecting (55, 222) to (73, 20).
; PLAN: r0=55(x1), r1=222(y1), r2=73(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 222
LDI r2, 73
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
