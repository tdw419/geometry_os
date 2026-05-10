; DESCRIPTION: Renders a orange line segment connecting (17, 163) to (300, 166).
; PLAN: r0=17(x1), r1=163(y1), r2=300(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 163
LDI r2, 300
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
