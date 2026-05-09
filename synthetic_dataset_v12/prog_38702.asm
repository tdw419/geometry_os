; DESCRIPTION: Places a magenta line segment connecting (408, 162) to (379, 92).
; PLAN: r0=408(x1), r1=162(y1), r2=379(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 162
LDI r2, 379
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
