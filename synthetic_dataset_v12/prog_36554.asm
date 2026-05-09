; DESCRIPTION: Places a orange line segment connecting (336, 0) to (459, 152).
; PLAN: r0=336(x1), r1=0(y1), r2=459(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 0
LDI r2, 459
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
