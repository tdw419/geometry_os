; DESCRIPTION: Places a magenta line segment connecting (53, 20) to (428, 227).
; PLAN: r0=53(x1), r1=20(y1), r2=428(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 20
LDI r2, 428
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
