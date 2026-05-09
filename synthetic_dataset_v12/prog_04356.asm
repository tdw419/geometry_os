; DESCRIPTION: Places a orange line segment connecting (35, 240) to (0, 196).
; PLAN: r0=35(x1), r1=240(y1), r2=0(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 240
LDI r2, 0
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
