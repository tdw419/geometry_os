; DESCRIPTION: Places a magenta line segment connecting (7, 219) to (144, 122).
; PLAN: r0=7(x1), r1=219(y1), r2=144(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 219
LDI r2, 144
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
