; DESCRIPTION: Places a magenta line segment connecting (221, 125) to (67, 131).
; PLAN: r0=221(x1), r1=125(y1), r2=67(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 125
LDI r2, 67
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
