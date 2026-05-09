; DESCRIPTION: Places a magenta line segment connecting (350, 59) to (430, 67).
; PLAN: r0=350(x1), r1=59(y1), r2=430(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 59
LDI r2, 430
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
