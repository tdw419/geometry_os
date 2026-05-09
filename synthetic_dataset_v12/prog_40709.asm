; DESCRIPTION: Places a blue line segment connecting (420, 99) to (447, 103).
; PLAN: r0=420(x1), r1=99(y1), r2=447(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 99
LDI r2, 447
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
