; DESCRIPTION: Places a orange line segment connecting (49, 223) to (206, 137).
; PLAN: r0=49(x1), r1=223(y1), r2=206(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 223
LDI r2, 206
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
