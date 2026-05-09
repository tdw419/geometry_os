; DESCRIPTION: Renders a black line between points (12, 85) and (68, 241).
; PLAN: r0=12(x1), r1=85(y1), r2=68(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 85
LDI r2, 68
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
