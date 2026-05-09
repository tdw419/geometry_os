; DESCRIPTION: Renders a orange line between points (482, 99) and (37, 31).
; PLAN: r0=482(x1), r1=99(y1), r2=37(x2), r3=31(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 99
LDI r2, 37
LDI r3, 31
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
