; DESCRIPTION: Places a orange line segment connecting (160, 226) to (163, 29).
; PLAN: r0=160(x1), r1=226(y1), r2=163(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 226
LDI r2, 163
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
