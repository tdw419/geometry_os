; DESCRIPTION: Places a magenta line segment connecting (366, 103) to (118, 165).
; PLAN: r0=366(x1), r1=103(y1), r2=118(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 103
LDI r2, 118
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
