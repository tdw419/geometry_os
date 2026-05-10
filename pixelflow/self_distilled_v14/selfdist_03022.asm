; DESCRIPTION: Renders a orange line segment connecting (7, 134) to (290, 57).
; PLAN: r0=7(x1), r1=134(y1), r2=290(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 134
LDI r2, 290
LDI r3, 57
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
