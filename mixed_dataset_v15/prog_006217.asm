; DESCRIPTION: Places a magenta line segment connecting (160, 121) to (476, 19).
; PLAN: r0=160(x1), r1=121(y1), r2=476(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 121
LDI r2, 476
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
