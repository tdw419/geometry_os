; DESCRIPTION: Renders a white line between points (15, 241) and (9, 98).
; PLAN: r0=15(x1), r1=241(y1), r2=9(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 241
LDI r2, 9
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
