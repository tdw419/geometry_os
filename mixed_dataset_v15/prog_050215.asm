; DESCRIPTION: Renders a orange line segment connecting (52, 47) to (35, 166).
; PLAN: r0=52(x1), r1=47(y1), r2=35(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 47
LDI r2, 35
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
