; DESCRIPTION: Places a orange line segment connecting (126, 17) to (57, 153).
; PLAN: r0=126(x1), r1=17(y1), r2=57(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 17
LDI r2, 57
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
