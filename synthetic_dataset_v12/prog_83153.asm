; DESCRIPTION: Places a yellow line segment connecting (28, 64) to (172, 158).
; PLAN: r0=28(x1), r1=64(y1), r2=172(x2), r3=158(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 64
LDI r2, 172
LDI r3, 158
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
