; DESCRIPTION: Renders a orange line between points (72, 109) and (166, 139).
; PLAN: r0=72(x1), r1=109(y1), r2=166(x2), r3=139(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 109
LDI r2, 166
LDI r3, 139
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
