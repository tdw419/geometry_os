; DESCRIPTION: Places a magenta line segment connecting (507, 67) to (270, 1).
; PLAN: r0=507(x1), r1=67(y1), r2=270(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 67
LDI r2, 270
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
