; DESCRIPTION: Places a orange line segment connecting (364, 249) to (29, 148).
; PLAN: r0=364(x1), r1=249(y1), r2=29(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 249
LDI r2, 29
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
