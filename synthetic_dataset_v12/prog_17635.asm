; DESCRIPTION: Places a magenta line segment connecting (98, 135) to (400, 53).
; PLAN: r0=98(x1), r1=135(y1), r2=400(x2), r3=53(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 135
LDI r2, 400
LDI r3, 53
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
