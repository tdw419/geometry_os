; DESCRIPTION: Places a magenta line segment connecting (504, 26) to (223, 131).
; PLAN: r0=504(x1), r1=26(y1), r2=223(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 26
LDI r2, 223
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
