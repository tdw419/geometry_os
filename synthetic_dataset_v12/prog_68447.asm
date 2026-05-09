; DESCRIPTION: Renders a orange line between points (86, 0) and (156, 39).
; PLAN: r0=86(x1), r1=0(y1), r2=156(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 0
LDI r2, 156
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
