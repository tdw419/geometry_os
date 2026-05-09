; DESCRIPTION: Places a orange line segment connecting (474, 223) to (35, 28).
; PLAN: r0=474(x1), r1=223(y1), r2=35(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 223
LDI r2, 35
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
