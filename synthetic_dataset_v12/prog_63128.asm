; DESCRIPTION: Places a orange line segment connecting (233, 198) to (443, 208).
; PLAN: r0=233(x1), r1=198(y1), r2=443(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 198
LDI r2, 443
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
