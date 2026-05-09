; DESCRIPTION: Places a orange line segment connecting (208, 189) to (365, 14).
; PLAN: r0=208(x1), r1=189(y1), r2=365(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 189
LDI r2, 365
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
