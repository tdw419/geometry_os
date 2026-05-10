; DESCRIPTION: Renders a orange line between points (281, 99) and (506, 84).
; PLAN: r0=281(x1), r1=99(y1), r2=506(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 99
LDI r2, 506
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
