; DESCRIPTION: Renders a orange line between points (124, 166) and (366, 156).
; PLAN: r0=124(x1), r1=166(y1), r2=366(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 166
LDI r2, 366
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
