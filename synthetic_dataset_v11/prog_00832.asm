; DESCRIPTION: Places a green line segment connecting (105, 135) to (64, 147).
; PLAN: r0=105(x1), r1=135(y1), r2=64(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 135
LDI r2, 64
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
