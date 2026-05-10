; DESCRIPTION: Places a orange line segment connecting (46, 76) to (172, 128).
; PLAN: r0=46(x1), r1=76(y1), r2=172(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 76
LDI r2, 172
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
