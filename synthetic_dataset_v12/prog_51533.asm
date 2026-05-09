; DESCRIPTION: Places a orange line segment connecting (240, 105) to (417, 7).
; PLAN: r0=240(x1), r1=105(y1), r2=417(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 105
LDI r2, 417
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
