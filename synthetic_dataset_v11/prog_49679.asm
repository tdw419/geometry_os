; DESCRIPTION: Places a red line segment connecting (2, 32) to (31, 237).
; PLAN: r0=2(x1), r1=32(y1), r2=31(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 32
LDI r2, 31
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
