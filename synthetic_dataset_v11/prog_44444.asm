; DESCRIPTION: Places a orange line segment connecting (48, 145) to (7, 4).
; PLAN: r0=48(x1), r1=145(y1), r2=7(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 145
LDI r2, 7
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
