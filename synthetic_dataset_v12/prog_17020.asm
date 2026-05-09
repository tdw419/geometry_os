; DESCRIPTION: Renders a orange line between points (119, 248) and (107, 166).
; PLAN: r0=119(x1), r1=248(y1), r2=107(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 248
LDI r2, 107
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
