; DESCRIPTION: Places a magenta line segment connecting (88, 111) to (266, 90).
; PLAN: r0=88(x1), r1=111(y1), r2=266(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 111
LDI r2, 266
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
