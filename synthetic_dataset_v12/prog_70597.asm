; DESCRIPTION: Places a magenta line segment connecting (412, 23) to (285, 52).
; PLAN: r0=412(x1), r1=23(y1), r2=285(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 23
LDI r2, 285
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
