; DESCRIPTION: Places a blue line segment connecting (92, 128) to (192, 114).
; PLAN: r0=92(x1), r1=128(y1), r2=192(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 128
LDI r2, 192
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
