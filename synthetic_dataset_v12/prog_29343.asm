; DESCRIPTION: Places a black line segment connecting (468, 24) to (356, 12).
; PLAN: r0=468(x1), r1=24(y1), r2=356(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 24
LDI r2, 356
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
