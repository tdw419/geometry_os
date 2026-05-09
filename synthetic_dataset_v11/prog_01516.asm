; DESCRIPTION: Places a magenta line segment connecting (74, 40) to (54, 78).
; PLAN: r0=74(x1), r1=40(y1), r2=54(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 40
LDI r2, 54
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
