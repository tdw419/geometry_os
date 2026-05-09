; DESCRIPTION: Places a orange line segment connecting (183, 13) to (57, 29).
; PLAN: r0=183(x1), r1=13(y1), r2=57(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 13
LDI r2, 57
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
