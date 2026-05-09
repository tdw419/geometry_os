; DESCRIPTION: Places a magenta line segment connecting (266, 131) to (254, 53).
; PLAN: r0=266(x1), r1=131(y1), r2=254(x2), r3=53(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 131
LDI r2, 254
LDI r3, 53
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
