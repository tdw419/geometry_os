; DESCRIPTION: Places a magenta line segment connecting (254, 62) to (131, 189).
; PLAN: r0=254(x1), r1=62(y1), r2=131(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 62
LDI r2, 131
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
