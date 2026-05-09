; DESCRIPTION: Places a magenta line segment connecting (196, 139) to (353, 1).
; PLAN: r0=196(x1), r1=139(y1), r2=353(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 139
LDI r2, 353
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
