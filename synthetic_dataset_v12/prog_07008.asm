; DESCRIPTION: Places a red line segment connecting (342, 214) to (44, 72).
; PLAN: r0=342(x1), r1=214(y1), r2=44(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 214
LDI r2, 44
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
