; DESCRIPTION: Places a white line segment connecting (72, 64) to (476, 40).
; PLAN: r0=72(x1), r1=64(y1), r2=476(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 64
LDI r2, 476
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
