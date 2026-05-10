; DESCRIPTION: Renders a orange line segment connecting (13, 6) to (221, 91).
; PLAN: r0=13(x1), r1=6(y1), r2=221(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 6
LDI r2, 221
LDI r3, 91
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
