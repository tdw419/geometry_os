; DESCRIPTION: Places a orange line segment connecting (69, 87) to (86, 222).
; PLAN: r0=69(x1), r1=87(y1), r2=86(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 87
LDI r2, 86
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
