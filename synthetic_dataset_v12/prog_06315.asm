; DESCRIPTION: Places a blue line segment connecting (344, 64) to (412, 48).
; PLAN: r0=344(x1), r1=64(y1), r2=412(x2), r3=48(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 64
LDI r2, 412
LDI r3, 48
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
