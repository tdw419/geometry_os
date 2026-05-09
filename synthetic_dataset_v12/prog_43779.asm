; DESCRIPTION: Places a magenta line segment connecting (179, 53) to (152, 165).
; PLAN: r0=179(x1), r1=53(y1), r2=152(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 53
LDI r2, 152
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
