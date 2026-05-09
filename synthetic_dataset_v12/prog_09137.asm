; DESCRIPTION: Places a orange line segment connecting (9, 239) to (145, 28).
; PLAN: r0=9(x1), r1=239(y1), r2=145(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 239
LDI r2, 145
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
