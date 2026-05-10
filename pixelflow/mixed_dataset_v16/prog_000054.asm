; DESCRIPTION: Places a orange line segment connecting (207, 108) to (76, 143).
; PLAN: r0=207(x1), r1=108(y1), r2=76(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 108
LDI r2, 76
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
