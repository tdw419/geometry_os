; DESCRIPTION: Places a magenta line segment connecting (504, 114) to (244, 191).
; PLAN: r0=504(x1), r1=114(y1), r2=244(x2), r3=191(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 114
LDI r2, 244
LDI r3, 191
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
