; DESCRIPTION: Places a orange line segment connecting (474, 66) to (460, 175).
; PLAN: r0=474(x1), r1=66(y1), r2=460(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 66
LDI r2, 460
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
