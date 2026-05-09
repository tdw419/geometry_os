; DESCRIPTION: Places a orange line segment connecting (230, 240) to (18, 75).
; PLAN: r0=230(x1), r1=240(y1), r2=18(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 240
LDI r2, 18
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
