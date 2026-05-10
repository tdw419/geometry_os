; DESCRIPTION: Places a yellow line segment connecting (490, 215) to (356, 76).
; PLAN: r0=490(x1), r1=215(y1), r2=356(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 215
LDI r2, 356
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
