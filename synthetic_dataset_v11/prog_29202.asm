; DESCRIPTION: Places a red line segment connecting (104, 185) to (67, 47).
; PLAN: r0=104(x1), r1=185(y1), r2=67(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 185
LDI r2, 67
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
