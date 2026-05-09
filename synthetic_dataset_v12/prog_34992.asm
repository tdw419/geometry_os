; DESCRIPTION: Places a orange line segment connecting (72, 138) to (4, 144).
; PLAN: r0=72(x1), r1=138(y1), r2=4(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 138
LDI r2, 4
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
