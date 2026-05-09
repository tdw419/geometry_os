; DESCRIPTION: Renders a orange line between points (12, 4) and (4, 14).
; PLAN: r0=12(x1), r1=4(y1), r2=4(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 4
LDI r2, 4
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
