; DESCRIPTION: Places a orange line segment connecting (102, 206) to (252, 172).
; PLAN: r0=102(x1), r1=206(y1), r2=252(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 206
LDI r2, 252
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
