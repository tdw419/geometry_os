; DESCRIPTION: Places a magenta line segment connecting (254, 198) to (219, 124).
; PLAN: r0=254(x1), r1=198(y1), r2=219(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 198
LDI r2, 219
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
