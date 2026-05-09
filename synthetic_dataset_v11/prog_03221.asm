; DESCRIPTION: Places a red line segment connecting (60, 104) to (222, 7).
; PLAN: r0=60(x1), r1=104(y1), r2=222(x2), r3=7(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 104
LDI r2, 222
LDI r3, 7
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
