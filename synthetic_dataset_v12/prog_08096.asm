; DESCRIPTION: Places a magenta line segment connecting (339, 113) to (164, 114).
; PLAN: r0=339(x1), r1=113(y1), r2=164(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 113
LDI r2, 164
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
