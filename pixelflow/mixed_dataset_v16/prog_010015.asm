; DESCRIPTION: Places a black line segment connecting (360, 104) to (214, 34).
; PLAN: r0=360(x1), r1=104(y1), r2=214(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 104
LDI r2, 214
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
