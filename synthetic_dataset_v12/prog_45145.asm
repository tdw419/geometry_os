; DESCRIPTION: Places a magenta line segment connecting (456, 19) to (379, 165).
; PLAN: r0=456(x1), r1=19(y1), r2=379(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 19
LDI r2, 379
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
