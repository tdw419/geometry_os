; DESCRIPTION: Places a magenta line segment connecting (67, 137) to (19, 102).
; PLAN: r0=67(x1), r1=137(y1), r2=19(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 137
LDI r2, 19
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
