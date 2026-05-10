; DESCRIPTION: Renders a orange line segment connecting (68, 93) to (187, 175).
; PLAN: r0=68(x1), r1=93(y1), r2=187(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 93
LDI r2, 187
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
