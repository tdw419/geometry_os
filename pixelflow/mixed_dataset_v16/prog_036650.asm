; DESCRIPTION: Places a orange line segment connecting (431, 253) to (69, 244).
; PLAN: r0=431(x1), r1=253(y1), r2=69(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 253
LDI r2, 69
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
