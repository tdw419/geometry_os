; DESCRIPTION: Places a magenta line segment connecting (136, 250) to (196, 248).
; PLAN: r0=136(x1), r1=250(y1), r2=196(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 250
LDI r2, 196
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
