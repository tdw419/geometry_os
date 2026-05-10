; DESCRIPTION: Places a magenta line segment connecting (420, 29) to (476, 60).
; PLAN: r0=420(x1), r1=29(y1), r2=476(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 29
LDI r2, 476
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
