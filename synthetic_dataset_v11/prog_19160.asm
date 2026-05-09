; DESCRIPTION: Places a orange line segment connecting (170, 240) to (40, 29).
; PLAN: r0=170(x1), r1=240(y1), r2=40(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 240
LDI r2, 40
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
