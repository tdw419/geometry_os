; DESCRIPTION: Renders a orange line between points (0, 175) and (53, 23).
; PLAN: r0=0(x1), r1=175(y1), r2=53(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 175
LDI r2, 53
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
