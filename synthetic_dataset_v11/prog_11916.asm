; DESCRIPTION: Places a black line segment connecting (233, 23) to (12, 203).
; PLAN: r0=233(x1), r1=23(y1), r2=12(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 23
LDI r2, 12
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
