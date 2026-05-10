; DESCRIPTION: Renders a orange line between points (236, 11) and (130, 109).
; PLAN: r0=236(x1), r1=11(y1), r2=130(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 11
LDI r2, 130
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
