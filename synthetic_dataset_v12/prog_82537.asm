; DESCRIPTION: Renders a orange line between points (466, 148) and (55, 166).
; PLAN: r0=466(x1), r1=148(y1), r2=55(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 148
LDI r2, 55
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
