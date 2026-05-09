; DESCRIPTION: Places a magenta line segment connecting (196, 17) to (136, 219).
; PLAN: r0=196(x1), r1=17(y1), r2=136(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 17
LDI r2, 136
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
