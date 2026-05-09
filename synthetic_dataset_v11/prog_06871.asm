; DESCRIPTION: Renders a orange line between points (64, 148) and (124, 18).
; PLAN: r0=64(x1), r1=148(y1), r2=124(x2), r3=18(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 148
LDI r2, 124
LDI r3, 18
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
