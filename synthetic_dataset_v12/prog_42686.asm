; DESCRIPTION: Places a orange line segment connecting (80, 110) to (240, 107).
; PLAN: r0=80(x1), r1=110(y1), r2=240(x2), r3=107(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 110
LDI r2, 240
LDI r3, 107
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
