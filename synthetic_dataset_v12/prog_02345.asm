; DESCRIPTION: Renders a orange line between points (23, 94) and (69, 253).
; PLAN: r0=23(x1), r1=94(y1), r2=69(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 94
LDI r2, 69
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
