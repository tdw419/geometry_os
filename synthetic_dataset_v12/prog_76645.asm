; DESCRIPTION: Places a red line segment connecting (342, 18) to (511, 87).
; PLAN: r0=342(x1), r1=18(y1), r2=511(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 18
LDI r2, 511
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
