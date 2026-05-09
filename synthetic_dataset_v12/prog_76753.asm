; DESCRIPTION: Renders a orange line between points (33, 50) and (18, 92).
; PLAN: r0=33(x1), r1=50(y1), r2=18(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 50
LDI r2, 18
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
