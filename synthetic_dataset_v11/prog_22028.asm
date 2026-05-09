; DESCRIPTION: Places a orange line segment connecting (33, 46) to (248, 50).
; PLAN: r0=33(x1), r1=46(y1), r2=248(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 46
LDI r2, 248
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
