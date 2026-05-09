; DESCRIPTION: Places a black line segment connecting (85, 55) to (35, 123).
; PLAN: r0=85(x1), r1=55(y1), r2=35(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 55
LDI r2, 35
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
