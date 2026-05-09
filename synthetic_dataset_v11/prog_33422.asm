; DESCRIPTION: Places a red line segment connecting (238, 124) to (249, 104).
; PLAN: r0=238(x1), r1=124(y1), r2=249(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 124
LDI r2, 249
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
