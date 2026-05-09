; DESCRIPTION: Places a orange line segment connecting (77, 15) to (443, 50).
; PLAN: r0=77(x1), r1=15(y1), r2=443(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 15
LDI r2, 443
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
