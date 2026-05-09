; DESCRIPTION: Places a magenta line segment connecting (219, 226) to (28, 202).
; PLAN: r0=219(x1), r1=226(y1), r2=28(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 226
LDI r2, 28
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
