; DESCRIPTION: Places a magenta line segment connecting (33, 16) to (19, 58).
; PLAN: r0=33(x1), r1=16(y1), r2=19(x2), r3=58(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 16
LDI r2, 19
LDI r3, 58
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
