; DESCRIPTION: Places a black line segment connecting (128, 36) to (1, 25).
; PLAN: r0=128(x1), r1=36(y1), r2=1(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 36
LDI r2, 1
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
