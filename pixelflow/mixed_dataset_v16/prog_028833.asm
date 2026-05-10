; DESCRIPTION: Renders a orange line segment connecting (391, 120) to (218, 76).
; PLAN: r0=391(x1), r1=120(y1), r2=218(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 120
LDI r2, 218
LDI r3, 76
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
