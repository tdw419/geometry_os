; DESCRIPTION: Places a white line segment connecting (105, 88) to (356, 87).
; PLAN: r0=105(x1), r1=88(y1), r2=356(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 88
LDI r2, 356
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
