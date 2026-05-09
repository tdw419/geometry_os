; DESCRIPTION: Places a magenta line segment connecting (218, 22) to (19, 227).
; PLAN: r0=218(x1), r1=22(y1), r2=19(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 22
LDI r2, 19
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
