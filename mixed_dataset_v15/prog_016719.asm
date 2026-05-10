; DESCRIPTION: Places a red line segment connecting (475, 35) to (1, 199).
; PLAN: r0=475(x1), r1=35(y1), r2=1(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 35
LDI r2, 1
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
