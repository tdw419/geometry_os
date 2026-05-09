; DESCRIPTION: Places a orange line segment connecting (442, 141) to (247, 252).
; PLAN: r0=442(x1), r1=141(y1), r2=247(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 141
LDI r2, 247
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
