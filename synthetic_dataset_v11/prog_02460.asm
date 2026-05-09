; DESCRIPTION: Renders a orange line between points (0, 50) and (138, 39).
; PLAN: r0=0(x1), r1=50(y1), r2=138(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 50
LDI r2, 138
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
