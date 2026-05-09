; DESCRIPTION: Places a magenta line segment connecting (209, 219) to (412, 5).
; PLAN: r0=209(x1), r1=219(y1), r2=412(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 219
LDI r2, 412
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
