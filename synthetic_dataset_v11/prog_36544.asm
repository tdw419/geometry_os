; DESCRIPTION: Places a red line segment connecting (13, 128) to (141, 0).
; PLAN: r0=13(x1), r1=128(y1), r2=141(x2), r3=0(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 128
LDI r2, 141
LDI r3, 0
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
