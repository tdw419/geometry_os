; DESCRIPTION: Places a orange line segment connecting (328, 50) to (234, 108).
; PLAN: r0=328(x1), r1=50(y1), r2=234(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 50
LDI r2, 234
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
