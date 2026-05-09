; DESCRIPTION: Places a red line segment connecting (494, 28) to (137, 72).
; PLAN: r0=494(x1), r1=28(y1), r2=137(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 28
LDI r2, 137
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
