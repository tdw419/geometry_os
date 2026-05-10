; DESCRIPTION: Renders a orange line between points (69, 254) and (35, 19).
; PLAN: r0=69(x1), r1=254(y1), r2=35(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 254
LDI r2, 35
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
