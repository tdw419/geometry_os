; DESCRIPTION: Renders a orange line segment connecting (278, 116) to (319, 56).
; PLAN: r0=278(x1), r1=116(y1), r2=319(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 116
LDI r2, 319
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
