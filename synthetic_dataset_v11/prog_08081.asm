; DESCRIPTION: Renders a orange line between points (143, 67) and (227, 44).
; PLAN: r0=143(x1), r1=67(y1), r2=227(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 67
LDI r2, 227
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
