; DESCRIPTION: Places a white line segment connecting (185, 22) to (356, 32).
; PLAN: r0=185(x1), r1=22(y1), r2=356(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 22
LDI r2, 356
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
