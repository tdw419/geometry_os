; DESCRIPTION: Renders a white line between points (245, 35) and (26, 122).
; PLAN: r0=245(x1), r1=35(y1), r2=26(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 35
LDI r2, 26
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
