; DESCRIPTION: Places a magenta line segment connecting (124, 219) to (203, 153).
; PLAN: r0=124(x1), r1=219(y1), r2=203(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 219
LDI r2, 203
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
