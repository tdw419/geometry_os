; DESCRIPTION: Renders a orange line between points (473, 92) and (104, 26).
; PLAN: r0=473(x1), r1=92(y1), r2=104(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 92
LDI r2, 104
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
