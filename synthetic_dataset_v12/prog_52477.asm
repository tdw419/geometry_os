; DESCRIPTION: Places a red line segment connecting (20, 0) to (256, 251).
; PLAN: r0=20(x1), r1=0(y1), r2=256(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 0
LDI r2, 256
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
