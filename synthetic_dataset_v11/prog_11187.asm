; DESCRIPTION: Places a orange line segment connecting (171, 55) to (248, 152).
; PLAN: r0=171(x1), r1=55(y1), r2=248(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 55
LDI r2, 248
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
