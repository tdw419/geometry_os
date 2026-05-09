; DESCRIPTION: Renders a orange line between points (189, 198) and (189, 172).
; PLAN: r0=189(x1), r1=198(y1), r2=189(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 198
LDI r2, 189
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
