; DESCRIPTION: Places a orange line segment connecting (336, 35) to (95, 17).
; PLAN: r0=336(x1), r1=35(y1), r2=95(x2), r3=17(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 35
LDI r2, 95
LDI r3, 17
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
