; DESCRIPTION: Renders a orange line between points (226, 22) and (130, 53).
; PLAN: r0=226(x1), r1=22(y1), r2=130(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 22
LDI r2, 130
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
