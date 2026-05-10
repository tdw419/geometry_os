; DESCRIPTION: Places a red line segment connecting (254, 122) to (116, 203).
; PLAN: r0=254(x1), r1=122(y1), r2=116(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 122
LDI r2, 116
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
