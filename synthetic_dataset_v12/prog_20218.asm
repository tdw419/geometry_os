; DESCRIPTION: Places a red line segment connecting (124, 139) to (0, 53).
; PLAN: r0=124(x1), r1=139(y1), r2=0(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 139
LDI r2, 0
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
