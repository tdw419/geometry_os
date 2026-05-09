; DESCRIPTION: Places a orange line segment connecting (209, 0) to (22, 115).
; PLAN: r0=209(x1), r1=0(y1), r2=22(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 0
LDI r2, 22
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
