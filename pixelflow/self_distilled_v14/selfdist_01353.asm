; DESCRIPTION: Renders a orange line segment connecting (28, 98) to (44, 21).
; PLAN: r0=28(x1), r1=98(y1), r2=44(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 98
LDI r2, 44
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
