; DESCRIPTION: Places a orange line segment connecting (511, 252) to (203, 192).
; PLAN: r0=511(x1), r1=252(y1), r2=203(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 252
LDI r2, 203
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
