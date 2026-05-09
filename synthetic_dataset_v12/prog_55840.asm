; DESCRIPTION: Places a orange line segment connecting (340, 98) to (339, 175).
; PLAN: r0=340(x1), r1=98(y1), r2=339(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 98
LDI r2, 339
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
