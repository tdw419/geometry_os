; DESCRIPTION: Places a red line segment connecting (246, 124) to (188, 104).
; PLAN: r0=246(x1), r1=124(y1), r2=188(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 124
LDI r2, 188
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
