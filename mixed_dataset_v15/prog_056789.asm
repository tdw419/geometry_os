; DESCRIPTION: Places a orange line segment connecting (16, 186) to (355, 55).
; PLAN: r0=16(x1), r1=186(y1), r2=355(x2), r3=55(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 186
LDI r2, 355
LDI r3, 55
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
