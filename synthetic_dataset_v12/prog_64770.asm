; DESCRIPTION: Places a yellow line segment connecting (356, 242) to (38, 106).
; PLAN: r0=356(x1), r1=242(y1), r2=38(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 242
LDI r2, 38
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
