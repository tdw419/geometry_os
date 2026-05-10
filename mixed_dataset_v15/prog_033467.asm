; DESCRIPTION: Places a blue line segment connecting (356, 179) to (364, 52).
; PLAN: r0=356(x1), r1=179(y1), r2=364(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 179
LDI r2, 364
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
