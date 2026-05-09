; DESCRIPTION: Places a orange line segment connecting (240, 52) to (6, 255).
; PLAN: r0=240(x1), r1=52(y1), r2=6(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 52
LDI r2, 6
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
