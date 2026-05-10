; DESCRIPTION: Renders a orange line between points (444, 244) and (211, 138).
; PLAN: r0=444(x1), r1=244(y1), r2=211(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 244
LDI r2, 211
LDI r3, 138
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
