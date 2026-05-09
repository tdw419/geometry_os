; DESCRIPTION: Places a white line segment connecting (88, 162) to (170, 55).
; PLAN: r0=88(x1), r1=162(y1), r2=170(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 162
LDI r2, 170
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
