; DESCRIPTION: Places a red line segment connecting (494, 224) to (2, 25).
; PLAN: r0=494(x1), r1=224(y1), r2=2(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 224
LDI r2, 2
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
