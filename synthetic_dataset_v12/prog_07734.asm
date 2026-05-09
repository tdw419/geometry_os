; DESCRIPTION: Places a blue line segment connecting (356, 55) to (32, 156).
; PLAN: r0=356(x1), r1=55(y1), r2=32(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 55
LDI r2, 32
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
