; DESCRIPTION: Places a magenta line segment connecting (105, 44) to (219, 206).
; PLAN: r0=105(x1), r1=44(y1), r2=219(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 44
LDI r2, 219
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
