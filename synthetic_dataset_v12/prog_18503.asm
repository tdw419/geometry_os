; DESCRIPTION: Places a magenta line segment connecting (379, 146) to (38, 208).
; PLAN: r0=379(x1), r1=146(y1), r2=38(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 146
LDI r2, 38
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
