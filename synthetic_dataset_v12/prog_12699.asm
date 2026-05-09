; DESCRIPTION: Renders a orange line between points (198, 116) and (130, 101).
; PLAN: r0=198(x1), r1=116(y1), r2=130(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 116
LDI r2, 130
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
