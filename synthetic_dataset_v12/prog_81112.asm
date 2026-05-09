; DESCRIPTION: Places a orange line segment connecting (369, 215) to (133, 104).
; PLAN: r0=369(x1), r1=215(y1), r2=133(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 215
LDI r2, 133
LDI r3, 104
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
