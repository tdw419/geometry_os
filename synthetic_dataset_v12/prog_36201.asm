; DESCRIPTION: Places a magenta line segment connecting (273, 136) to (103, 165).
; PLAN: r0=273(x1), r1=136(y1), r2=103(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 136
LDI r2, 103
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
