; DESCRIPTION: Places a magenta line segment connecting (67, 191) to (91, 255).
; PLAN: r0=67(x1), r1=191(y1), r2=91(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 191
LDI r2, 91
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
