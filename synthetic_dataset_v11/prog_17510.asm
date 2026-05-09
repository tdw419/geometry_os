; DESCRIPTION: Places a orange line segment connecting (55, 90) to (214, 253).
; PLAN: r0=55(x1), r1=90(y1), r2=214(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 90
LDI r2, 214
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
