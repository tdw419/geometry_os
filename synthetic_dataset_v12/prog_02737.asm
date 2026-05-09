; DESCRIPTION: Renders a orange line between points (509, 7) and (33, 3).
; PLAN: r0=509(x1), r1=7(y1), r2=33(x2), r3=3(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 7
LDI r2, 33
LDI r3, 3
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
